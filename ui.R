library(shiny)
library(httr)

ui <- fluidPage(
  titlePanel("NFL Injuries"),
  sidebarLayout(
    sidebarPanel(
      radioButtons('season', "Choose season by year", c("2014-2015", "2015-2016", "2016-2017")),
      textInput('position_choice', "Choose position")
    ),
    mainPanel(
      h2("Step 1: Choose Season Year"),
      h2("Step 2: Choose one of the following positions"),
      h4(textOutput('positions')),
      plotOutput("plot"),
      tableOutput('join_table')
    )
  )
)

shinyUI(ui)