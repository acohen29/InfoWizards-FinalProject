library(shiny)
library(httr)
source("key.R")

func <- function(input, output) {
  #url <- paste0("https://api.mysportsfeeds.com/v1.2/pull/nfl/", input$season, "/player_injuries.csv")
  #output$table <- renderTable(GET(url), add_headers(Authorization= paste("Basic", msf_credentials)))
}

shinyServer(func)