library("shiny")
library("httr")
library("dplyr")
library("jsonlite")
library("ggplot2")
library("plotly")
library("quantreg")
library("gganimate")
source("key.R")

# Reads in csv files containing data for each player, each game per season
fantasy_2017 <- read.csv(file = "2017_2018_Fantasy.csv", stringsAsFactors = FALSE)
fantasy_2016 <- read.csv(file = "2016_2017_Fantasy.csv", stringsAsFactors = FALSE)
fantasy_2015 <- read.csv(file = "2015_2016_Fantasy.csv", stringsAsFactors = FALSE)
fantasy_2014 <- read.csv(file = "2014_2015_Fantasy.csv", stringsAsFactors = FALSE)

vector <- c(2, 3, 4)
# Creates 2 vectors by extracting values from 2 cetain columns

# For 2017
salary_2017 <- fantasy_2017$X.Salary
points_2017 <- fantasy_2017$X.Fantasy.Points


# For 2016
salary_2016 <- fantasy_2016$X.Salary
points_2016 <- fantasy_2016$X.Fantasy.Points

# For 2015
salary_2015 <- fantasy_2015$X.Salary
points_2015 <- fantasy_2015$X.Fantasy.Points

# For 2014
salary_2014 <- fantasy_2014$X.Salary
points_2014 <- fantasy_2014$X.Fantasy.Points


# First, creates a function that will Run an rsquared test to test the correlation between 
# how much a player costs and how many points he puts up. Then use the salary and points
# For each player each game for seasons 2014-2017 to test the correlation per year
rsq <- function(x, y) summary(lm(y~x))$r.squared

rsq(salary_2017, points_2017)
rsq(salary_2016, points_2016)
rsq(salary_2015, points_2015)
rsq(salary_2014, points_2014)

# We get answers .15-.2 depending on the year. This signals a very weak correlation
# Between salary and points. More specifically, salary can only explain ~10% of the
# standard deviation. The other 90% are based on luck, chance, or other 
# Unpredictable factors



# Code for question 3

theme_set(theme_bw())  # pre-set the bw theme.
g <- ggplot(fantasy_2017, aes(X.Salary, X.Fantasy.Points))
g + geom_count(col="tomato3", show.legend=F) +
  labs(subtitle="Cost vs Points", 
       y="points", 
       x="Price", 
       title="Counts Plot")

theme_set(theme_bw())  # pre-set the bw theme.
g <- ggplot(fantasy_2016, aes(X.Salary, X.Fantasy.Points))
g + geom_count(col="tomato3", show.legend=F) +
  labs(subtitle="Cost vs Points", 
       y="points", 
       x="Price", 
       title="Counts Plot")

theme_set(theme_bw())  # pre-set the bw theme.
g <- ggplot(fantasy_2015, aes(X.Salary, X.Fantasy.Points))
g + geom_count(col="tomato3", show.legend=F) +
  labs(subtitle="Cost vs Points", 
       y="points", 
       x="Price", 
       title="Counts Plot")

theme_set(theme_bw())  # pre-set the bw theme.
g <- ggplot(fantasy_2014, aes(X.Salary, X.Fantasy.Points))
g + geom_count(col="tomato3", show.legend=F) +
  labs(subtitle="Cost vs Points", 
       y="points", 
       x="Price", 
       title="Counts Plot")











       