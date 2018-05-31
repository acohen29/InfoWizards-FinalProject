library(shiny)
library(httr)
library(shinythemes)
source("analysis.R")

ui <- navbarPage(
  "NFL Injuries",

  #============================================================================
  # Landing Page
  #============================================================================

  tabPanel("Landing",
           titlePanel("Info Wizards Info 201 AC3"),
           p(landing)
           ),

  #============================================================================
  # Question 1
  #============================================================================

  tabPanel("Question 1",
    titlePanel("Question 1"),
    sidebarLayout(
      sidebarPanel(
        radioButtons("season", "Choose season by year",
                     c("2014-2015" = "2014-2015-regular", "2015-2016" = "2015-2016-regular",
                       "2016-2017" = "2016-2017-regular", "Latest" = "latest")),
        textInput("position_choice", "Choose position", placeholder = "All Positions")
      ),
      mainPanel(
        h3("Step 1: Choose Season Year"),
        h3("Step 2: Choose one of the following positions"),
        h4(textOutput('positions')),
        br(),
        plotOutput('plot')
      )
    ),
    br(),
    textOutput("q1_analysis")
  ),

  #============================================================================
  # Question 2
  #============================================================================

  tabPanel("Question 2",
           titlePanel("Question 2"),
           sidebarLayout(
             sidebarPanel(
               radioButtons('map_selection', "Choose which map to view",
                            c("Map states to league rank" = 1, "Map states to injuries" = 2)),
               radioButtons("season", "Choose season by year",
                            c("2014-2015" = "2014-2015-regular", "2015-2016" = "2015-2016-regular",
                              "2016-2017" = "2016-2017-regular", "Latest" = "latest"))
             ),
             mainPanel(
               plotOutput('map')
             )
           )
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
