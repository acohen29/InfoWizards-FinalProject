library(shiny)
library(httr)

ui <- fluidPage(
  titlePanel("Title"),
  sidebarLayout(
    sidebarPanel(
      radioButtons('season', "Choose season by year", c("2014-2015", "2015-2016", "2016-2017"))
    ),
    mainPanel(
      dataTableOutput('table')
    )
  )
)

shinyUI(ui)