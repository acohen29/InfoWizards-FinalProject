landing <- "Welcome to the Info Wizards Football Analysis Program.
             This program allows you to explore data on the NFL relating to injures, team location as it realates to performance
             and fantasy data relating to the cost of a player. Data for this project was courtesy
             of https://www.mysportsfeeds.com. The goal of this project was to analyze what factors may play into team success and
             how team success is valued. To display this, we chose to break the information down into several
             distinct categories for easier user accessibility. The first section presents
             data on NFL injuries and how those affect team performance. The overall goal of
             this section is to show the importance of particular positions for a football team. This
             displays positional importance based on team performance after an injury. The second section 
             presents data injuries and ranks by state. This section presents data on other factors that 
             may influence a team's success, specifically geographical location. It is often said that 
             football is the only sport where bad weather only makes the teams play harder. Our goal in this
             section was to see if geographical location (paired to weather), has any affect on team performance.
             Finally, the third section of this report focuses on
             fantasy football players and how their draft price compares to their actual point output. This section
             displays how players are valued. We wanted to examine this section in particular to establish if
             players were being valued correctly by fantasy owners, and whether the prices that were paid for fantasy players
             were connected to the value of the player on the teams performance as a whole and were connected to 
             the states that were advantageous (e.g. few injuries and high rank). We hope you enjoy the following report!"

q1_analysis_1 <- "A note to the user: The following analysis is valid only when the year 2016-2017 is selected
and the chosen position is RB. The question we set out to answer for this section was:
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
                                          who sustained an injury to their starting running back was"


q1_analysis_2 <- "compared to the league average average rank of 16.
Interestingly, this data included a significant outlier.
One of the running backs, Jay Ajayi of the Dolphins,
went down with an injury, but despite this the team’s rank
remained well above the average at 9, a full 7 points above league average.
This data point certainly seems to be an outlier,
especially since each of the other teams who had running
backs go down with an injury were ranked fairly low. The
importance of what we found was that teams who had injuries
at the RB position were on average 4 points below the rest of
the league in terms of rank indicating that they were at a
disadvantage. While this experiment was performed with the
utmost caution to avoid bias, there are a few issues that
should be mentioned. The NFL consists of only 32 which means
it is not exactly an ideally sized data set, and the number of teams who had running back
injuries was only 4 according to the API data we collected.
However, the data that we have found indicates an interesting trend in terms of the importance
of running backs."

q2_analysis_1 <- "A note to the user: the following analysis is valid only when the year 2016-2017
is selected. This section is designed to give the user an understanding of how geographical location
is related to rank and injuries. Our hypothesis was that states in which were likely to experiance 
harsher winters, (e.g northern states) were more likely to have injuries than states that experianced
very mild winters. To analyze this, we looked at a pair of states, Wisconsin and Texas. What we found
was that the average rank in Wisconsin was "

q2_analysis_2 <- "compared to an average rank in Texas of "

q2_analysis_3 <- ".While not conclusive, the difference of "

q2_analysis_4 <- "seems to indicate that there is a potential correlation between the states location
and the average rank of the team within the state. Further more, we examined the same two states in terms
of the number of injuries. What we found that Wisconsin had "

q2_analysis_5 <- "injuries while Texas had "

q2_analysis_6 <- "injuries. Overall these results would appear to indicate that "
