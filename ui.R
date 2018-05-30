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
           p("Welcome to the Info Wizards Football Analysis Program. 
             This program allows you to explore data on football injuries, team success, 
             salaries and the value of NFL draft picks. Data for this project was courtesy 
             of https://www.mysportsfeeds.com. The goal of this project is to display the 
             importance of data as it relates to injuries and the management of a professional 
             football team. To display this, we chose to break the information down into several 
             distinct categories for easier user accessibility. The first section presents 
             data on NFL injuries and how those affect team performance. The overall goal of 
             this section is to show the importance of particular positions for a football team 
             as it relates to team performance. The second section presents data on NFL salaries 
             based on positions. The first tab displayed how injuries affected team performance, 
             the second tab builds upon this idea and examines how salaries relate to positional 
             impacts on team performance. Finally, the third section of this report focuses on 
             draft picks and how drafting players affects team performance. The report is crafted 
             in such a way as to make these sections distinct. The different sections can be 
             found under their corresponding tabs at the top of the page. You are presently at the 
             Homepage.")
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
        h4(textOutput("positions")),
        plotOutput("plot")
      )
    ), textOutput("text")
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
