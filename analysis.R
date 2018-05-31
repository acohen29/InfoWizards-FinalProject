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
went down with an injury, but despite this the team's rank
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

q2_analysis_6 <- "injuries. Overall these results would appear to indicate that extreme weather in locations 
like Green Bay Wisconsin, may have an effect on the team's rank and additionally it would appear that
the weather may have ahad an effect on the injuries as well. While these trends would need further confirmation
be be established as fact, this trend may be indicative of a broader corelation."


q3_analysis_1 <- "Our Analysis revolved around two variables: 1) how much a player cost 2) how many 
                   points said player earned. Fantasy football is a game in which people draft real 
                   life players in hopes of outscoring their opponent. Points are earned by real life
                   accolades and achievements such as touchowns, yards, etc. The bigger the game a 
                   player has, the more points he earns for your team.
                   
                   Our focus revolved around DFS, a unique variation of fantasy football where instead
                   of drafting in snake order at the beginning of the season, participants draft their
                   lineup on a week to week basis. One can say that this method elminates the luck aspect
                   of fantasy football. Later, we will depict how luck is still the biggest factor and
                   it is here to stay."
q3_analysis_2 <- "First, we took a look at our multiple datasets involving more than 10,000 entries
                   per season. We selected and narrowed down the focus on two columns/categories. How
                   much a player cost(DFS/Salary) and how many points said player earned the corresponding
                   week. We then ran an r-squared test on these two variables and found that generally,
                   you can expect an r-squared of .15-.2 which signals a very weak correlation, if 
                   any exists at all. In other words, only 7% - 12% of the standard deiation can be
                   explaiend by player price. the other 88% - 93% is caused by other factors, 
                   mainly luck."
q3_analysis_3 <- "Despite the fact that there was very little correlation between price and points 
                   returned, we still think player price somewhat reflects their value.Football, both
                   real and fantasy are determined not by one influential event but multiple small ones
                   which add up. The difference between 10 points could be half a second too early or 
                   half a step too late. Thus, there is bound to be some variance. Lastly, nobody in the 
                   public has access to one of the most important aspects of this all: the coaching and
                   play-calling. If NFL coaches and teams are trying to move erratically to prevent other
                   worlds class professional athletes and coaches from predicting their plays, then its
                   unlikely that the average spectator and fan stands a better shot. We only had 4 
                   seasons worth of data to work with. As we accumulate more while technology improves
                   simultaneously, more accurate models and predictions will be possible."

conclusion_1 <- "As seen in the previous tabs, we found some interesting correlations in our project.
While it would be incorrect to state with 100% certainty that all of the results that we have come to
are guaranteed always to be true, we have found evidence that there may be a correlation between
player injuries at certain positions and team performance. We did find a potential correlation between team location
and rank, in addition to a potential correlation between team location and injuries. Interestingly,
we found little correlation between player price and their actual point value. This was a surprising result,
we had expected stars, who fantasy owners paid a lot for, to have a signficant impact in terms of performance.
However, as stated, we feel that these result may be due to variance and that overall there may be a correlation
between price and performance. So what do these results mean? What we have showed is that there are several
factors that can potentially influence team performance, including injuries and geographical location, not to mention
team managment, salary allocation and draft effictivness which we were unfortunately not able to explore given the 
time constraint. In addition we found that price may have less of a correlation to performance that we thought. All of this
indicates that football is a complex sport in which no one factor can be deemed to be conclusive. That said,
we have found that proper valuation of players, and the avoidance of injuries may well be important in determining
team success."
