library(shiny)
library(httr)
library(dplyr)
library(jsonlite)
source("key.R")

func <- function(input, output) {
  reactive <- reactiveValues()
  reactive$result <- data.frame("")
  observeEvent(input$season, {
    url <- paste0("https://api.mysportsfeeds.com/v1.2/pull/nfl/", input$season, "-regular/player_injuries.json")
    response <- GET(url, add_headers('Content-Type' = "application/json"),
                    authenticate(msf_user, msf_pass))
    
    content <- content(response, "text", encoding = "UTF-8")
    result <- fromJSON(content, flatten = T)
    reactive$result <- result$playerinjuries$playerentry %>%
      mutate(Name = paste(player.FirstName, player.LastName)) %>%
      select(Name, player.ID, injury, team.Name, player.Position)
  })

  output$table <- renderDataTable(reactive$result)
}

shinyServer(func)


