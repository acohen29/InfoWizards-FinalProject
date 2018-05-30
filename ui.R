library(shiny)
library(httr)
library(shinythemes)

ui <- navbarPage(
  "NFL Injuries",

  #============================================================================
  # Landing Page
  #============================================================================

  tabPanel("Landing",
           titlePanel("Info Wizards Info 201 AC3"),
           p("Overview and additional analysis here")
           ),

  #============================================================================
  # Question 1
  #============================================================================

  tabPanel("Question 1",
    titlePanel("Question 1"),
    sidebarLayout(
      sidebarPanel(
        radioButtons("season", "Choose season by year",
                     c("2012-2013" = "2012-2013-regular", "2013-2014" = "2013-2014-regular",
                       "2014-2015" = "2014-2015-regular", "2015-2016" = "2015-2016-regular",
                       "2016-2017" = "2016-2017-regular", "Latest" = "latest")),
        textInput("position_choice", "Choose position", placeholder = "All Positions")
      ),
      mainPanel(
        h3("Step 1: Choose Season Year"),
        h3("Step 2: Choose one of the following positions"),
        h4(textOutput("positions")),
        plotOutput("plot")
      )
    )
  ),

  #============================================================================
  # Question 2
  #============================================================================

  tabPanel("Question 2",
           titlePanel("Question 2")
           ),

  #============================================================================
  # Question 3
  #============================================================================

  tabPanel("Question 3",
           titlePanel("Question 3")
           ),

  theme = shinytheme("flatly")
)

shinyUI(ui)
