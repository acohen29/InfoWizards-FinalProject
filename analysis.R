landing <- "Welcome to the Info Wizards Football Analysis Program.
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
             Homepage."

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

q2_analysis_1 <- "The second question we wanted to ask was: 
How does salary relate to team performance. To do 
this we looked at salary data for each position and how 
it compared to the league average salary. The position that 
we were specifically interested in was RB’s given that we 
had established a potential trend indicating that they were 
very important to a team’s overall success. What we found was 
that running backs earned an average of"

q2_analysis_2 <- "in 2017 compared to the league average salary of "

q2_analysis_3 <- "While not conclusive, the difference of "

q2_analysis_4 <- "seems to indicate that the league highly values 
a rushing attack. Given the trend that shows that running backs appear
to be significant players in terms of indicating a team’s success, this 
resulting trend would seem to make sense. The importance of this trend is 
that it indicates that it indicates a potential correlation between a players 
importance in getting wins, and their salary. While this trend might seem 
obvious, it raised some questions. The most interesting of these questions 
is whether poor spending might be related poor team performance. 
Unfortunately, the API we used to complete this project does not presently 
have sufficient data to evaluate this potential trend. The above graphic can 
also be altered to see how other positions average salaries compares to the 
league average."