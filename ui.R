library(shiny)
library(httr)

ui <- fluidPage(
  titlePanel("Title"),
  sidebarLayout(
    sidebarPanel(
      textInput('season', "Enter Season (Ex: '2016-2017')")
    ),
    mainPanel(
      tableOutput('table')
    )
  )
)

shinyUI(ui)