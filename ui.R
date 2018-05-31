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
           ),
           textOutput("q2_analysis")
         ),

  #============================================================================
  # Question 3
  #============================================================================
  
  tabPanel("Question 3",
           titlePanel("Should you cash out on pricey players?"),
           sidebarLayout(
             sidebarPanel(
               radioButtons("season", "Choose season by year",
                            c("2014-2015" = "2014-2015-regular", "2015-2016" = "2015-2016-regular",
                              "2016-2017" = "2016-2017-regular", "Latest" = "latest")),
               textInput("position_choice", "Choose position", placeholder = "All Positions")
             ),
             mainPanel(
               h1("Cost vs Return - The Analysis"),
               div(
                 h3("Brief Introduction"),
                 p("Our Analysis revolved around two variables: 1) how much a player cost 2) how many 
                   points said player earned. Fantasy football is a game in which people draft real 
                   life players in hopes of outscoring their opponent. Points are earned by real life
                   accolades and achievements such as touchowns, yards, etc. The bigger the game a 
                   player has, the more points he earns for your team.
                   
                   Our focus revolved around DFS, a unique variation of fantasy football where instead
                   of drafting in snake order at the beginning of the season, participants draft their
                   lineup on a week to week basis. One can say that this method elminates the luck aspect
                   of fantasy football. Later, we will depict how luck is still the biggest factor and
                   it is here to stay."),
                 h3("How we did our analysis"),
                 p("First, we took a look at our multiple datasets involving more than 10,000 entries
                   per season. We selected and narrowed down the focus on two columns/categories. How
                   much a player cost(DFS/Salary) and how many points said player earned the corresponding
                   week. We then ran an r-squared test on these two variables and found that generally,
                   you can expect an r-squared of .15-.2 which signals a very weak correlation, if 
                   any exists at all. In other words, only 7% - 12% of the standard deiation can be
                   explaiend by player price. the other 88% - 93% is caused by other factors, 
                   mainly luck."),
                 h3("Practical Takeaway"),
                 p("Despite the fact that there was very little correlation between price and points 
                   returned, we still think player price somewhat reflects their value.Football, both
                   real and fantasy are determined not by one influential event but multiple small ones
                   which add up. The difference between 10 points could be half a second too early or 
                   half a step too late. Thus, there is bound to be some variance. Lastly, nobody in the 
                   public has access to one of the most important aspects of this all: the coaching and
                   play-calling. If NFL coaches and teams are trying to move erratically to prevent other
                   worlds class professional athletes and coaches from predicting their plays, then its
                   unlikely that the average spectator and fan stands a better shot. We only had 4 
                   seasons worth of data to work with. As we accumulate more while technology improves
                   simultaneously, more accurate models and predictions will be possible.")
               ),
               
  
               
               h4(textOutput('positions')),
               br(),
               plotOutput('plot')
             )
           ),
           br(),
           textOutput("q1_analysis")
  ),
  tabPanel("Conclusion",
           mainPanel(
             h1("Conclusion"),
             p("As seen in the previous tabs, we found some interesting correlations in our project.
While it would be incorrect to state with 100% certainty that all of the results that we have come to
               are guaranteed always to be true, we have found evidence that there may be a correlation between
               player injuries at certain positions and team performance. Unfortunately, we are not able to say with complete
               certianty that there is a correlation between geographical location and team rank or injuries. Interestingly,
               we found little correlation between player price and their actual point value. This was a surprising result,
               we had expected stars, who fantasy owners paid a lot for, to have a signficant impact in terms of performance.
               However, as stated, we feel that these result may be due to variance and that overall there may be a correlation
               between price and performance. So what do these results mean? What we have showed is that there are several
               factors that can potentially influence team performance, including injuries and geographical location, not to mention
               team managment, salary allocation and draft effictivness which we were unfortunately not able to explore given the 
               time constraint. In addition we found that price may have less of a correlation to performance that we thought. All of this
               indicates that football is a complex sport in which no one factor can be deemed to be conclusive. That said,
               we have found that proper valuation of players, and the avoidance of injuries may well be important in determining
               team success.")
           )),
  
  
  theme = shinytheme("flatly")
)

shinyUI(ui)


