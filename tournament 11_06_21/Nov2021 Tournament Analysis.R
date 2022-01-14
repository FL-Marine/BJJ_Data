# About Section ----
# This data is about my first BJJ competition in almost 10 years.
# My matches were recorded and afterwards I watched the videos and collected data on my performance.

# Tournament points ----
# 4 Points: Full mount, Back mount.
# 3 Points: Passing the guard, Passing the half guard.
# 2 Points: Takedown, Guard sweep, Half guard sweep, Knee on belly.
# Advantages only count if the match ends in a tie.

# Calling Libraries ----
library(dplyr)
library(ggplot2)
library(tidyverse)
library(treemapify)
library(forcats)
library(esquisse)
# Initial Data Exploration ----

## Reading CSV ----
bjjdata <- read.csv("~/R Projects/BJJ_Data/BJJ_R data - Copy.csv")
View(bjjdata)

## Inspecting structure of dataframe ----
str(bjjdata)
# The following need to be factors since they are categories
# match_id
# category
# move_name
# submission
# W or L
# move_id

## High level view of dataframe ----
summary(bjjdata)
# Noticed there are NA's in points_scored and points_scored_upon which will not hinder analysis

## Changing to Factors ----
bjjdata$match_id <- as.factor(bjjdata$match_id)
bjjdata$category <- as.factor(bjjdata$category)
bjjdata$move_name <- as.factor(bjjdata$move_name)
bjjdata$Submission <- as.factor(bjjdata$Submission)
bjjdata$W.or.L <- as.factor(bjjdata$W.or.L)
bjjdata$move_id <- as.factor(bjjdata$move_id)
bjjdata$match_style <- as.factor(bjjdata$match_style)
# R stores categories as factors which must be changed for proper analysis.
# Rule of thumb if a column is something I wouldn't use an aggregate function then its a factor. For example, match_id denotes a key identifer per match.

## Checking new dataframe structure ----
str(bjjdata)

## New high level summary check ----
summary(bjjdata)

# Analysis ----

ggplot(data = bjjdata, mapping = aes(x = category)) + geom_bar()
#this is plotting the category count amounts which is misleading

## Avg points scored per match ----
sum(bjjdata$points_scored, na.rm = TRUE) / 5
# Scored an avg of 7.2 points per match

## Avg points gave up per match ----
sum(bjjdata$points_scored_upon, na.rm = TRUE) / 5
# Gave up an avg of 2.2 points per match

## Tournament Record & Win/Loss Ratio ----
table(bjjdata$W.or.L)
# 4 Wins, 1 Loss

# Win/Loss Ratio
4/5
# 80% Win % for the day 

## Offense succeeded ----

### Frequency of offensive successes ----
table(bjjdata$offense_succeeded)
# 0 - not attempted or succeeded
# 1 - 7x a move was done successfully once
# 2 - 7x a move was done successfully twice
# 3 - 1x a move was done successfully x3 
# 4 - 1x a move was done successfully x4 
# 5 - 5x a move was done successfully once

### % of offensive successes ----
prop.table(table(bjjdata$offense_succeeded))
# 0 - 84%.5 not attempted or succeeded
# 1 - 6.3% of moves were successes 7x
# 2 - 6.3% of moves were successes 7x
# 3 - 5 0.009090909% of offense was successful

### Sum of offensive successes ----
sum(bjjdata$offense_succeeded)
# 33x  my offensive was successful


ggplot(bjjdata, aes(x = offense_succeeded)) + geom_bar() + geom_text(
  aes(label = ..count..),
  stat = "count",
  vjust = 0.015,
  color = "black"
)
# This shows a count of how many times an offensive move succeeded
# 0 - 93x
# 1 - 7x
# 2 - 7x
# 3 - 5 - 1x 

## Offensive Attempts ----

### Frequency of offensive attempts ----
table(bjjdata$offense_attempted)
# 0 - not attempted or succeeded
# 1 - 7x a move was attempted once
# 2 - 1x a move was attempted twice
# 3 - 3x time a move was attempted
# 5 - 1 move was attempted 5x 

### % of offensive attempts ----
prop.table(table(bjjdata$offense_attempted))
# 0 - 89% not attempted
# 1 - 6.3% of moves attempted twice
# 2 - 6.3% of moves were successes 7x
# 3 - 2.72% of offensive attempts were done 3x
# 5 - 0.009090909% of moves were attempted 5x

### Sum of offensive attempts ----
sum(bjjdata$offense_attempted)
# 23x did I make offensive attempts

ggplot(bjjdata, aes(x = offense_attempted)) + geom_bar() + geom_text(
  aes(label = ..count..),
  stat = "count",
  vjust = 0.015,
  color = "black"
)
# This shows a count of how many times an offensive move was attempted
# 0 - 98x
# 1 - 7x
# 2 - 1x
# 3 - 3x
# 4 - 0x
# 5 - 1x 

## Defense succeeded ----

### Frequency of offensive successes ----
table(bjjdata$defense_succeeded)
# 0 - not attempted or succeeded
# 1 - 9x a move was successfully defended once
# 2 - 5x a move was successfully defended twice
# 3 - 3x a move successfully defended
# 5 - 5x a successfully defended once

### % of defensive successes ----
prop.table(table(bjjdata$defense_succeeded))
# 0 - 83%.6 not attempted or succeeded
# 1 - 8.1 of moves successfully defended once
# 2 - 4.5% of moves were successfully defended twice
# 3 - 2.72% of moves ere successfully defended 3x
# 5 - 0.009090909% was a move defensed 5x

### Sum of defense successes ----
sum(bjjdata$defense_succeeded)
# 33x  my offensive was successful

ggplot(bjjdata, aes(x = defense_succeeded)) + geom_bar() + geom_text(
  aes(label = ..count..),
  stat = "count",
  vjust = 0.015,
  color = "black"
)
# This shows a count of how many times a defensive move was successful
# 0 - 92x
# 1 - 9x
# 2 - 2x
# 3 - 3x
# 4 - 0x
# 5 - 1x 

## Defense Attempts ----

### Frequency of offensive attempts ----
table(bjjdata$defense_attempted)
# 0 - not attempted or succeeded
# 1 - 8x I made a defensive attempt once from various moves
# 2 - 1x I made a defensive attempt twice

### % of defense attempts ----
prop.table(table(bjjdata$defense_attempted))
# 0 - 91.8% not attempted
# 1 - 7.2% of moves were defensive attempts once
# 2 - 0.009090909% of moves were defensive attempts twice

### Sum of defense attempts ----
sum(bjjdata$defense_attempted)
# 10x did I make defensive attempts

ggplot(bjjdata, aes(x = defense_attempted)) + geom_bar() + geom_text(
  aes(label = ..count..),
  stat = "count",
  vjust = 0.015,
  color = "black"
)
# This shows a count of how many times an defensive move was attempted
# 0 - 101x
# 1 - 8x
# 2 - 1x

## Move analysis ----

###  Offensive success ----
bjjdata_move_name <- bjjdata %>% 
  filter(offense_succeeded > 0) %>%
  select(move_name, category, offense_succeeded, offense_attempted)
# Created a new dataframe to filter and determine what offensive moves were most effective

bjjdata_move_name_vector1 <-
  aggregate(cbind(offense_succeeded, offense_attempted) ~ move_name,
            bjjdata_move_name,
            sum)
# Aggregated the previous dataframe to add the values by move_name
offense_attempted
# move_name offense_succeeded 
# 1          Back                 1                 0
# 2         Guard                 6                 0
# 3    Guard Pass                 3                 4
# 4    Half Guard                 5                 0
# 5 Lateral throw                 7                 0
# 6         Mount                 4                 0
# 7  Side Control                 5                 0
# 8         Sweep                 2                 0

ggplot(
  bjjdata_move_name_vector1,
  aes(
    area = offense_succeeded,
    fill = move_name,
    label = paste0(move_name, "\n", offense_succeeded)
  )
) +
  geom_treemap() + geom_treemap_text() + theme(legend.position =  "none") + labs(title = "Top Successful Offensive Moves")
# Top 3 successful offense moves
# 1. Lateral throw
# 2. Offensive guard
# 3. Offensive half guard

#### Points Score per move ----

points_scored <- bjjdata_move_name_vector1 %>% 
  select(move_name, offense_succeeded) 
# Created new dataframe  
  
points_scored$total_points <- 4 
# Added a new column  

points_scored_vector <- c(4, 0, 3, 0, 2, 4, 3, 2)
# Created pointed scored vector

points_scored <- cbind(points_scored, points_scored_vector) %>% 
  select(-total_points)

points_scored$points_earned <- points_scored$offense_succeeded * points_scored$points_scored_vector
# Final points scored dataframe

# equisse
esquisser()
# Run this to pull up Tableau like drag and drop way to build viz's

points_scored %>%
  filter(points_earned >= 1L & points_earned <= 16L) %>%
  ggplot() +
  aes(x = move_name, weight = points_earned) +
  geom_bar(fill = "#112446") +  geom_text(
    aes(label = ..count..),
    stat = "count",
    vjust = 1.5,
    colour = "white"
  ) +
  labs(x = "Move Name",
       title = "Points Scored",
       subtitle = "Moves & amount of points scored against opponents") +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16L, face = "bold"),
    # axis.title.y = element_text(face = "bold"),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank(),
    axis.title.x = element_text(face = "bold"),
    axis.title.y = element_blank()
    
  ) 
# Mounted positions are worth 4 points which is a good way to control the match and set up different submissions.
# Controlling an opponent in side control is worth 3 point
# I had 7 lateral throws worth 2 points, this tells me that take down is super effective but I need more takedowns in my arsenal.

### Defensive success ----
bjjdata_move_name_defense <- bjjdata %>% 
  filter(defense_succeeded > 0) %>%
  select(move_name, category, defense_succeeded, defense_attempted)
# Created a new dataframe to filter and determine what offensive moves were most effective

bjjdata_move_name_vector2 <-
  aggregate(cbind(defense_succeeded, defense_attempted) ~ move_name,
            bjjdata_move_name_defense,
            sum)
# move_name defense_succeeded defense_attempted
# 1     Arm bar                 1                 0
# 2    Arm Drag                 3                 0
# 3        Back                 2                 0
# 4  Double Leg                 4                 0
# 5       Guard                 2                 0
# 6      Kimura                 1                 1
# 7       Mount                 2                 0
# 8  Single Leg                 4                 0
# 9       Sweep                 5                 4
# 10   Triangle                 2                 0
# 11       Trip                 7                 0

ggplot(bjjdata_move_name_vector2,
       aes(x = fct_rev(fct_reorder(move_name, defense_succeeded)), y = defense_succeeded)) +
        geom_col() + geom_text(aes(label = defense_succeeded),
        vjust = 1,
        color = "white") + 
        labs(title = "Top Successful Defensive Moves") +  
        theme(axis.text.y = element_blank(),
              axis.ticks.y = element_blank()) + labs(x = "move_name")
# Top 3 successful defensive  moves
# 1. Trip
# 2. Sweep
# 3. Tie single and double leg

#### Points defended per move ----
points_defended <- bjjdata_move_name_vector2 %>% 
  select(move_name, defense_succeeded)
# Created new dataframe  

points_defended$total_points <- 4 
# Added a new column 

points_defended_vector <- c(0, 2, 4, 2, 0, 0, 4, 2, 2, 0, 2)
# Created pointed defended vector

points_defended <- cbind(points_defended, points_defended_vector) %>% 
  select(-total_points)

points_defended$points_prevented <- points_defended$defense_succeeded * points_defended$points_defended_vector
# Final points defended dataframe

# equisse
esquisser()
# Run this to pull up Tableau like drag and drop way to build viz's

points_defended %>%
  filter(points_prevented >= 1L & points_prevented <= 14L) %>%
  ggplot() +
  aes(x = move_name, weight = points_prevented) +
  geom_bar(fill = "#051C45") + geom_text(
    aes(label = ..count..),
    stat = "count",
    vjust = 1.5,
    colour = "white"
  ) +
  labs(
    x = "Move Name",
    y = "Total Points Prevented",
    title = "Points Prevented",
    subtitle = "This shows which points I successfully defended"
  ) +
  theme_gray() +
  theme(
    plot.title = element_text(size = 16L, face = "bold"),
    axis.title.y = element_text(face = "bold"),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank(),
    axis.title.x = element_text(face = "bold")
  )
# Successfully defending trips prevented my opponents from scoring 14 points on me.
       
                                                  