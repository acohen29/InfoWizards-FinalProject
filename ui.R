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
                     c("2014-2015", "2015-2016", "2016-2017")),
        textInput("position_choice", "Choose position")
      ),
      mainPanel(
        h2("Step 1: Choose Season Year"),
        h2("Step 2: Choose one of the following positions"),
        h4(textOutput("positions")),
        tableOutput("join_table")
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
