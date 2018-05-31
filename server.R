library(shiny)
library(httr)
library(dplyr)
library(jsonlite)
library(ggplot2)
library(maps)
source("key.R")
source("analysis.R")

func <- function(input, output) {
  reactive <- reactiveValues()

  city_to_state <- us.cities %>%
    select(name, country.etc) %>%
    left_join(data.frame(abbr = state.abb, state = state.name, stringsAsFactors = F), by = c("country.etc" = "abbr"))
  city_to_state$name <- substr(city_to_state$name, 0, nchar(city_to_state$name) - 3)

  observeEvent(input$season, {
    reactive$base_url <- paste0(
      "https://api.mysportsfeeds.com/v1.2/pull/nfl/",
      input$season
    )
  })

  observeEvent(input$season_2, {
    reactive$base_url <- paste0(
      "https://api.mysportsfeeds.com/v1.2/pull/nfl/",
      input$season_2
    )
  })

  # ============================================================================
  # GETS the API Databases when the desired year changes
  # ============================================================================

  observeEvent({
    input$season
    input$season_2
  }, {


    # ==========================================================================
    # API and manipulations to injury dataset
    # ==========================================================================

    injury_result <- GET(
      paste0(reactive$base_url, "/player_injuries.json"),
      add_headers("Content-Type" = "application/json"),
      authenticate(msf_user, msf_pass)
    ) %>%
      content("text", encoding = "UTF-8") %>%
      fromJSON(flatten = T)
    reactive$injury <- injury_result$playerinjuries$playerentry %>%
      mutate(Name = paste(player.FirstName, player.LastName)) %>%
      select(Name, player.ID, injury, player.Position, team.Name, team.ID, team.City) %>%
      mutate(has_injury = T)

    reactive$positions <- as.vector(unique(reactive$injury$player.Position))

    # ==========================================================================
    # API and manipulations to team standings dataset
    # ==========================================================================

    standings_result <- GET(
      paste0(reactive$base_url, "/overall_team_standings.json"),
      add_headers("Content-Type" = "application/json"),
      authenticate(msf_user, msf_pass)
    ) %>%
      content("text", encoding = "UTF-8") %>%
      fromJSON(flatten = T)
    reactive$standing <- standings_result$overallteamstandings$teamstandingsentry %>%
      select(rank, team.ID, team.Name, team.City, team.Abbreviation)
    reactive$standing$rank <- as.numeric(reactive$standing$rank)

    reactive$rank_injury <- left_join(reactive$injury, reactive$standing, by = "team.ID")
  })

  # ============================================================================
  # Filters datasets when desired position or season changes
  # ============================================================================

  observeEvent({
    input$season
    input$position_choice
  }, {
    if (input$position_choice != "") {
      reactive$data_plot_1 <- filter(reactive$rank_injury, player.Position == input$position_choice)
      position <- input$position_choice
    } else {
      reactive$data_plot_1 <- reactive$rank_injury
      position <- "All Positions"
    }

    temp_table <- group_by(reactive$data_plot_1, rank) %>%
      summarize(num = n())

    reactive$data_plot_1 <- left_join(reactive$data_plot_1, temp_table, by = "rank")

    reactive$injured_mean <- reactive$data_plot_1$rank %>%
      unique() %>%
      as.numeric() %>%
      mean()

    # ========================================================================
    # Code for Question 1 Plot
    # ========================================================================

    reactive$plot <- ggplot(reactive$data_plot_1) +
      geom_point(mapping = aes(x = team.Name.x, y = rank)) +
      geom_col(
        mapping = aes(x = team.Name.x, y = (rank / num), fill = team.Abbreviation),
        width = 1
      ) +
      scale_fill_brewer(palette = "Blues") +
      guides(fill = "none") +
      labs(
        title = paste0("Team ranks (for those with injuries at ", position, ")
                         compared to the league average"),
        x = "Team Names",
        y = "Rank"
      )
  })

  # ============================================================================
  # Choice for Map Data Set
  # ============================================================================
  observeEvent({
    input$season_2
    input$map_selection
  }, {
    us_map <- map_data("state")
    us_map$region <- stringr::str_to_title(us_map$region)

    if (input$map_selection == 1) {
      reactive$map_data <- left_join(reactive$standing, city_to_state, by = c("team.City" = "name"))
      reactive$map_data <- left_join(us_map, reactive$map_data, by = c("region" = "state"))
      reactive$map <- ggplot(reactive$map) +
        geom_polygon(mapping = aes(
          x = long, y = lat, group = region,
          fill = rank, color = "black"
        )) +
        coord_quickmap() +
        guides(fill = F, color = F) +
        scale_color_brewer(palette = "Greys") +
        scale_x_continuous(breaks = NULL, name = NULL) +
        scale_y_continuous(breaks = NULL, name = NULL) +
        labs(
          title = "Team Rankings by State"
        )
    } else {
      map <- left_join(reactive$injury, city_to_state, by = c("team.City" = "name"))
      map <- left_join(us_map, map, by = c("region" = "state"))
      reactive$map <- ggplot(map) +
        geom_polygon(mapping = aes(
          x = long, y = lat, group = region,
          fill = has_injury, color = "black"
        )) +
        coord_quickmap() +
        guides(fill = F, color = F) +
        scale_color_brewer(palette = "Greys") +
        scale_x_continuous(breaks = NULL, name = NULL) +
        scale_y_continuous(breaks = NULL, name = NULL) +
        labs(
          title = "Player Injuries by State"
        )
    }
  })

  # ============================================================================
  # On plot Click
  # ============================================================================

  observeEvent(input$click, {
    selected <- data.frame(nearPoints(reactive$data_plot_1, input$click))
    selected <- select(selected, Name, injury, team.Name.x)
    colnames(selected) <- c("Name", "Injury", "Team")
    reactive$player <- selected
  })


  # ============================================================================
  # Outputs
  # ============================================================================

  output$positions <- renderText(reactive$positions)
  output$plot <- renderPlot(reactive$plot)
  output$q1_analysis <- renderText(paste(q1_analysis_1, reactive$injured_mean, q1_analysis_2))
  output$map <- renderPlot(reactive$map)
  output$q2_analysis <- renderText(paste(
    q2_analysis_1, "10", q2_analysis_2, "6", 
    q2_analysis_3, "4",q2_analysis_4, "2",
    q2_analysis_5, "0", q2_analysis_6
  ))
  output$player <- renderTable(reactive$player)
}

shinyServer(func)