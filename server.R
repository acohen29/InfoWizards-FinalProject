library(shiny)
library(httr)
library(dplyr)
library(jsonlite)
library(ggplot2)
source("key.R")

func <- function(input, output) {
  reactive <- reactiveValues()
  reactive$injury_table <- data.frame("")
  reactive$team_table <- data.frame("")
  reactive$joined <- data.frame("")
  reactive$positions <- c("")
  reactive$plot <- ggplot()
  
  
  #============================================================================
  # Get manipulations to player salary datset
  #============================================================================

  
  #============================================================================
  # GETS the API Databases when the desired year changes
  #============================================================================
  
  observeEvent(input$season, {
    base_url <- paste0("https://api.mysportsfeeds.com/v1.2/pull/nfl/", 
                       input$season)
    
    #==========================================================================
    # API and manipulations to injury dataset
    #==========================================================================
    
    injury_result <- GET(paste0(base_url, "/player_injuries.json"), 
                         add_headers('Content-Type' = "application/json"),
                    authenticate(msf_user, msf_pass)) %>%
      content("text", encoding = "UTF-8") %>%
      fromJSON(flatten = T)
    reactive$injury <- injury_result$playerinjuries$playerentry %>%
      mutate(Name = paste(player.FirstName, player.LastName)) %>%
      select(Name, player.ID, injury, player.Position, team.Name, team.ID)
    
    reactive$positions <- as.vector(unique(reactive$injury$player.Position))
    
    #==========================================================================
    # API and manipulations to team standings dataset
    #==========================================================================
    
    standings_result <- GET(paste0(base_url, "/overall_team_standings.json"),
                            add_headers('Content-Type' = "application/json"),
                            authenticate(msf_user, msf_pass)) %>%
      content("text", encoding = "UTF-8") %>%
      fromJSON(flatten = T)
    reactive$standing <- standings_result$overallteamstandings$teamstandingsentry %>%
      select(rank, team.ID, team.Name, team.Abbreviation)
    
    reactive$rank_injury <- left_join(reactive$injury, reactive$standing, by = "team.ID")
  })
  
  #============================================================================
  # Filters datases when desired position or season changes
  #============================================================================
  
  observeEvent({
    input$season 
    input$position_choice}, {
      if (input$position_choice != "") {
        data_plot_1 <- filter(reactive$rank_injury, player.Position == input$position_choice)
        position <- input$position_choice
      } else {
        data_plot_1 <- reactive$rank_injury
        position <- "All Positions"
      }
      
      #========================================================================
      # Code for Question 1 Plot
      #========================================================================
      
      reactive$plot <- ggplot(data_plot_1) +
        geom_bar(mapping = aes(x = team.Name.x, y = as.numeric(rank), fill = team.Abbreviation),
                 width = 1, stat = "identity") +
        scale_fill_brewer(palette = "Blues") +
        guides(fill = "none") +
        labs(
          title = paste0("Team ranks (for those with injuries at ", position, ") 
                         compared to the league average"),
          x = "Team Names",
          y = "Rank")
    })
  
  #============================================================================
  # Outputs
  #============================================================================
  
  output$positions <- renderText(reactive$positions)
  output$plot <- renderPlot(reactive$plot)
  
}

shinyServer(func)










