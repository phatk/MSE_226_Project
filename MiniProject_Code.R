library(cvTools)
library(tidyverse)
library(tibble)
library(GGally)
library(plotly)

setwd("/Users/tylercoleman/Desktop/")

# Loading the data: 22 Observations for each play, from each player perspective
NFL_DATA <- read.csv(file = "train.csv", header = TRUE, sep=",")
View(NFL_DATA)

# We only want from the position of the running back as info about other players is captured
NFL_DATA_Run_Observations <- NFL_DATA[(NFL_DATA$NflIdRusher == NFL_DATA$NflId), ]
View(NFL_DATA_Run_Observations)

# Split the runs for runner into a train and test set

set.seed(123)
training_data = sample(nrow(NFL_DATA_Run_Observations), size = nrow(NFL_DATA_Run_Observations) * 0.8) # get 80% of training data for training
NFL_DATA_Train = NFL_DATA_Run_Observations[training_data, ] 
NFL_DATA_Holdout = NFL_DATA_Run_Observations[-training_data, ] # holdout is remaining indices
View(NFL_DATA_Train) 

# Explore distribution of the continuos response variable we are predicting. (Yards/carry)
ggplot(data = NFL_DATA_Train) + 
  geom_histogram(mapping = aes(x = Yards), bins = 100) + 
  ggtitle("Distribution of Yards")

# Zoom into specifically -10 to 20 yards
ggplot(data = NFL_DATA_Train) + 
  geom_histogram(mapping = aes(x = Yards), bins = 100) + 
  coord_cartesian(xlim=c(-10,20), ylim=c(0, 4000)) + 
  geom_vline(xintercept = 4) + 
  ggtitle("Distribution of Yards")

# 2, 3, 4, 5 yards in particular are the peaks

# What percentage of runs result in > 10 yards? 0.0956517
More_Than_10 = NFL_DATA_Train[(NFL_DATA_Train$Yards > 10), ]
Percentage_Over_10 =  nrow(More_Than_10) / nrow(NFL_DATA_Train) 
Percentage_Over_10

# What Percentage of runs is < 0 yards? 0.1101101
Less_Than_0 = NFL_DATA_Train[(NFL_DATA_Train$Yards < 0), ]
Percentage_under_0 =  nrow(Less_Than_0) / nrow(NFL_DATA_Train) 
Percentage_under_0

# See if there is difference in run yard by quarter

NFL_DATA_Train$Quarter = factor(NFL_DATA_Train$Quarter)

# First quarter
ggplot(data = NFL_DATA_Train[(NFL_DATA_Train$Quarter == 1), ]) + 
  geom_histogram(mapping = aes(x = Yards), bins = 100) + 
  ggtitle("Distribution of Yards in 1 Quarter")

# Second quarter
ggplot(data = NFL_DATA_Train[(NFL_DATA_Train$Quarter == 2), ]) + 
  geom_histogram(mapping = aes(x = Yards), bins = 100) + 
  ggtitle("Distribution of Yards in 2 Quarter")

# Third quarter
ggplot(data = NFL_DATA_Train[(NFL_DATA_Train$Quarter == 3), ]) + 
  geom_histogram(mapping = aes(x = Yards), bins = 100) + 
  ggtitle("Distribution of Yards in 3 Quarter")

# Fourth quarter
ggplot(data = NFL_DATA_Train[(NFL_DATA_Train$Quarter == 4), ]) + 
  geom_histogram(mapping = aes(x = Yards), bins = 100) + 
  ggtitle("Distribution of Yards in 4 Quarter")

# Plot 3d of X and Y position, and yards gotten
plot_ly(
  NFL_DATA_Train, x = ~X, y = ~Y, z = ~Yards, color = ~PossessionTeam) %>%
  add_markers() %>%
  layout(
    scene = list(xaxis = list(title = 'X'),
                 yaxis = list(title = 'Y'),
                 zaxis = list(title = 'Yards'))
  )

# Plot 3d of down and distance, and yards gotten
plot_ly(
  NFL_DATA_Train, x = ~Distance, y = ~Down, z = ~Yards, color = ~PossessionTeam) %>%
  add_markers() %>%
  layout(
    scene = list(xaxis = list(title = 'Distance'),
                 yaxis = list(title = 'Down'),
                 zaxis = list(title = 'Yards'))
)

NFL_DATA_Train$OffenseFormation = factor(NFL_DATA_Train$OffenseFormation)
NFL_DATA_Train$DefendersInTheBox = factor(NFL_DATA_Train$DefendersInTheBox)

# Plot 3d of offense formation and defenders in box, and yards gotten
plot_ly(
  NFL_DATA_Train, x = ~OffenseFormation, y = ~DefendersInTheBox, z = ~Yards, color = ~PossessionTeam) %>%
  add_markers() %>%
  layout(
    scene = list(xaxis = list(title = 'OffenseForm'),
                 yaxis = list(title = 'DefendInBox'),
                 zaxis = list(title = 'Yards'))
)





# Mutations 
# Difference in Score (Pair with which team is winning (HomeScore-AwayScore))
# Difference in time between snap and handoff (Done)
# What team is on defense
# Age

# Data we want
# GameId, PlayId, Team, X, Y, NFLID, Quarter, GameClock, PossesionTeam
# Down, Distance, HomeScoreBeforePlay, VisitorScoreBeforePlay, NflIdRusher,
# OffenseFormation, OffensePersonel, DefendersinBox, DefensePersonel, 
# Play direction, Yards, PlayerHeight, PlayerWeight, PlayerBirthDate, HomeTeamAbbr
# AwayTeamAbbr, Week, StadiumType, Turf, GameWeather, Temperature, Humidity




  
  
