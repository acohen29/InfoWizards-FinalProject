library(shiny)
library(httr)
library(shinythemes)
source("analysis.R")

ui <- navbarPage(
  "NFL Injuries",

  # ============================================================================
  # Landing Page
  # ============================================================================

  tabPanel(
    "Welcome",
    mainPanel(
      titlePanel("Coorelating NFL Player & Team Success and Value"),
      h4("Info Wizards Info 201 AC3"),
      h4("Alex Cohen, Paul Winebrenner, Phillip Quach"),
      p(landing)
    )
  ),

  # ============================================================================
  # Question 1
  # ============================================================================

  tabPanel(
    "Question 1",
    titlePanel("Analysis on NFL Player Injuries to Rank"),
    sidebarLayout(
      sidebarPanel(
        radioButtons(
          "season", "Choose season by year ",
          c(
            "2014-2015" = "2014-2015-regular", "2015-2016" = "2015-2016-regular",
            "2016-2017" = "2016-2017-regular", "Latest" = "latest"
          )
        ),
        textInput("position_choice", "Choose position", placeholder = "All Positions")
      ),
      mainPanel(
        h3("Step 1: Choose Season Year"),
        h3("Step 2: Choose one of the following positions"),
        h4(textOutput("positions")),
        h3("Step 3: Click dot to pull up specific player info"),
        br(),
        plotOutput("plot", click = "click"),
        tableOutput("player")
      )
    ),
    br(),
    textOutput("q1_analysis")
  ),

  # ============================================================================
  # Question 2
  # ============================================================================

  tabPanel(
    "Question 2",
    titlePanel("Geographical Impact on NFL Player Injuries and Rank"),
    sidebarLayout(
      sidebarPanel(
        radioButtons(
          "map_selection", "Choose which map to view",
          c("Map states to injuries" = 2, "Map states to league rank (Lighter = Better Rank)" = 1)
        ),
        radioButtons(
          "season_2", "Choose season by year",
          c(
            "2014-2015" = "2014-2015-regular", "2015-2016" = "2015-2016-regular",
            "2016-2017" = "2016-2017-regular", "Latest" = "latest"
          )
        )
      ),
      mainPanel(
        plotOutput("map")
      )
    ),
    textOutput("q2_analysis")
  ),

  # ============================================================================
  # Question 3
  # ============================================================================

  tabPanel(
    "Question 3",
    titlePanel("Should you cash out on pricey players?"),
    mainPanel(
      h1("Cost vs Return - The Analysis"),
      div(
        h3("Brief Introduction"),
        p(q3_analysis_1),
        h3("How we did our analysis"),
        p(q3_analysis_2),
        h3("Practical Takeaway"),
        p(q3_analysis_3)
      )
    )
  ),

  # ============================================================================
  # Conclusion
  # ============================================================================

  tabPanel(
    "Conclusion",
    mainPanel(
      h1("Conclusion"),
      p(conclusion_1)
    )
  ),
  theme = shinytheme("flatly")
)

shinyUI(ui)