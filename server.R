library(shiny)
library(httr)
library(dplyr)
library(jsonlite)
library(ggplot2)
source("key.R")

func <- function(input, output) {
  reactive <- reactiveValues()
  
  #============================================================================
  # Get manipulations to player salary datset
  #============================================================================

  salary_result <- GET(paste0("https://api.mysportsfeeds.com/v1.2/pull/nfl/2016-2017-regular/active_players.json"), 
                       add_headers('Content-Type' = "application/json"),
                       authenticate(msf_user, msf_pass)) %>%
    content("text", encoding = "UTF-8") %>%
    fromJSON(flatten = T)
  reactive$salary <- salary_result$active_players$playerentry %>%
    select(player.ID, )
  
  #============================================================================
  # GETS the API Databases when the desired year changes
  #============================================================================
  
  observeEvent(input$season, {
    base_url <- paste0("https://api.mysportsfeeds.com/v1.2/pull/nfl/", 
                       input$season)
    
    #==========================================================================
    # API and manipulations to injury dataset
    #==========================================================================
    
    injury_result <- GET(paste0(base_url, "/player_injuries.json"), 
                         add_headers('Content-Type' = "application/json"),
                    authenticate(msf_user, msf_pass)) %>%
      content("text", encoding = "UTF-8") %>%
      fromJSON(flatten = T)
    reactive$injury <- injury_result$playerinjuries$playerentry %>%
      mutate(Name = paste(player.FirstName, player.LastName)) %>%
      select(Name, player.ID, injury, player.Position, team.Name, team.ID)
    
    reactive$positions <- as.vector(unique(reactive$injury$player.Position))
    
    #==========================================================================
    # API and manipulations to team standings dataset
    #==========================================================================
    
    standings_result <- GET(paste0(base_url, "/overall_team_standings.json"),
                            add_headers('Content-Type' = "application/json"),
                            authenticate(msf_user, msf_pass)) %>%
      content("text", encoding = "UTF-8") %>%
      fromJSON(flatten = T)
    reactive$standing <- standings_result$overallteamstandings$teamstandingsentry %>%
      select(rank, team.ID, team.Name, team.Abbreviation)
    
    reactive$rank_injury <- left_join(reactive$injury, reactive$standing, by = "team.ID")
  })
  
  #============================================================================
  # Filters datases when desired position or season changes
  #============================================================================
  
  observeEvent({
    input$season 
    input$position_choice}, {
      if (input$position_choice != "") {
        data_plot_1 <- filter(reactive$rank_injury, player.Position == input$position_choice)
        position <- input$position_choice
      } else {
        data_plot_1 <- reactive$rank_injury
        position <- "All Positions"
      }
      reactive$injured_mean <- data_plot_1$rank %>% 
        unique() %>% 
        as.numeric() %>% 
        mean()
      
      #========================================================================
      # Code for Question 1 Plot
      #========================================================================
      
      reactive$plot <- ggplot(data_plot_1) +
        geom_bar(mapping = aes(x = team.Name.x, y = as.numeric(rank), fill = team.Abbreviation),
                 width = 1, stat = "identity") +
        scale_fill_brewer(palette = "Blues") +
        guides(fill = "none") +
        labs(
          title = paste0("Team ranks (for those with injuries at ", position, ") 
                         compared to the league average"),
          x = "Team Names",
          y = "Rank")
    })
  
  #============================================================================
  # Outputs
  #============================================================================
  
  output$positions <- renderText(reactive$positions)
  output$plot <- renderPlot(reactive$plot)
  output$text <- renderText(paste("The question we set out to answer for this section was: 
                                            How do injures to certain positions impact team success? 
                                            One of the most important players on a team is the running back. 
                                          A balanced offensive attack is often considered key to getting wins, 
                                          the most effective marker of team success. As evidenced by the 
                                          Seattle Seahawks of late, a lack of a rushing game can be a 
                                          serious issue in terms of helping a team to win. As a result, we 
                                          looked at running back injuries during the 2016-2017 season. During 
                                          that season, running backs were the position group that had the most 
                                          amount of injuries, something that was not unexpected given the 
                                          physicality of the position and the frequency with which running 
                                          backs are injured. What we found was that the average rank for teams 
                                          who sustained an injury to their starting running back was", reactive$injured_mean, 
                                          "compared to the league average average rank of 16. 
                                          Interestingly, this data included a significant outlier. 
                                          One of the running backs, Jay Ajayi of the Dolphins, 
                                          went down with an injury, but despite this the team’s rank 
                                          remained well above the average at 9, a full 7 points above league average. 
                                          This data point certainly seems to be an outlier, 
                                          especially since each of the other teams who had running 
                                          backs go down with an injury were ranked fairly low. The 
                                          importance of what we found was that teams who had injuries 
                                          at the RB position were `r mean - r mean` below the rest of 
                                          the league in terms of rank indicating that they were at a 
                                          disadvantage. While this experiment was performed with the 
                                          utmost caution to avoid bias, there are several factors that 
                                          should be mentioned as important. The sample size upon which the 
                                          t-test was taken was not very big only 4 players were listed according 
                                          to API that we used. Additionally, the NFL consists of only 32 which means 
                                          it is not exactly an ideally sized data set. However, the data that we 
                                          have found indicates an interesting trend in terms of the importance 
                                          of running backs."))
  
}

shinyServer(func)










