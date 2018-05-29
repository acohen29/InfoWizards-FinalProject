library(shiny)
library(httr)
library(dplyr)
library(jsonlite)
source("key.R")

func <- function(input, output) {
  reactive <- reactiveValues()
  reactive$injury_table <- data.frame("")
  reactive$team_table <- data.frame("")
  reactive$positions <- c("")
  
  #=====================================================#
  # GETS the API Databases when the desired year changes#
  #=====================================================#
  
  observeEvent(input$season, {
    base_url <- paste0("https://api.mysportsfeeds.com/v1.2/pull/nfl/", input$season, "-regular")
    
    injury_result <- GET(paste0(base_url, "/player_injuries.json"), add_headers('Content-Type' = "application/json"),
                    authenticate(msf_user, msf_pass)) %>%
      content("text", encoding = "UTF-8") %>%
      fromJSON(flatten = T)
    reactive$injury <- injury_result$playerinjuries$playerentry %>%
      mutate(Name = paste(player.FirstName, player.LastName)) %>%
      select(Name, player.ID, injury, player.Position, team.Name, team.ID)
    
    standings_result <- GET(paste0(base_url, "/overall_team_standings.json"), add_headers('Content-Type' = "application/json"),
                            authenticate(msf_user, msf_pass)) %>%
      content("text", encoding = "UTF-8") %>%
      fromJSON(flatten = T)
    reactive$standing <- standings_result$overallteamstandings$teamstandingsentry %>%
      select(rank, team.ID, team.Name, team.Abbreviation)
    
    reactive$positions <- as.vector(unique(reactive$injury$player.Position))
    
    if (input$position_choice != "") {
      reactive$injury_table <- filter(reactive$injury, player.Position == input$position_choice)
      teams <- as.vector(unique(reactive$table$team_ID))
    } else {
      reactive$injury_table <- reactive$injury
      reactive$team_table <- reactive$standing
    }
  })
  
  #=======================================================#
  # Filters API Databases by when desired position changes#
  #=======================================================#
  
  observeEvent(input$position_choice, {
    if (input$position_choice != "") {
      reactive$injury_table <- filter(reactive$injury, player.Position == input$position_choice)
      teams <- as.vector(unique(reactive$table$team_ID))
    } else {
      reactive$injury_table <- reactive$injury
      reactive$team_table <- reactive$standing
    }
  })
  
  output$positions <- renderText(reactive$positions)
  output$injury_table <- renderTable(reactive$injury_table)
  output$team_table <- renderTable(reactive$team_table)
}

shinyServer(func)










