---
title: "11/6/21 Tournament Analysis"
author: "Abe"
date: "1/2/2022"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)

# ## GitHub Documents
# 
# This is an R Markdown format used for publishing markdown documents to GitHub. When you click the **Knit** button all R code chunks are run and a markdown file (.md) suitable for publishing to GitHub is generated
# 
# ## Including Plots
# 
# You can also embed plots, for example:
# 
# ```{r pressure, echo=FALSE}
# plot(pressure)
# 
# Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
```

## Calling Libraries
```{r}
library(dplyr)
library(ggplot2)
```

## Questions for analysis
```{r}
# Win rate when I get takedowns vs being take down

# Highest % move/ sub

# What have I gotten caught the most with

# Look at data and create my own vectors?

# You could probably take a look at opportunities for improvement based on opponent success rate
# 
# Remove reaction
# 
# 
# Or look at the characteristics of your wins and see what influences them
```

## Reading CSV
```{r}
bjjdata <- read.csv("~/R Projects/BJJ_Data/BJJ_R data - Copy.csv")
View(bjjdata)
```

## Inspecting structure of dataframe
```{r}
glimpse(bjjdata)
# The following need to be factors since they are categories
# match_id
# category
# move_name
# submission
# W or L
# move_id
```

## High level view of dataframe
```{r}
summary(bjjdata)
# Noticed there are too many NA's in columns which will throw off results
```

## Dropping NA's
```{r}
na_index_moveid <- is.na(bjjdata$move_id)
table(na_index_moveid)
```

```{r}
na_index_oa <- is.na(bjjdata$offense_attempted)
table(na_index_oa)

na_index_os <- is.na(bjjdata$offense_succeeded)
table(na_index_os)

na_index_da <- is.na(bjjdata$defense_attempted)
table(na_index_da)

na_index_ds <- is.na(bjjdata$defense_succeeded)
table(na_index_ds)

na_index_matchid <- is.na(bjjdata$match_id)
table(na_index_matchid)
```

```{r}
na_index_points_scored <- is.na(bjjdata$points_scored)
table(na_index_points_scored)
```

```{r}
na_index_points_scored_upon <- is.na(bjjdata$points_scored_upon)
table(na_index_points_scored_upon)
```

```{r}
bjjdata_clean <- bjjdata[!na_index_da,]
```

## Changing to Factors
```{r}
bjjdata$match_id <- as.factor(bjjdata$match_id)
bjjdata$category <- as.factor(bjjdata$category)
bjjdata$move_name <- as.factor(bjjdata$move_name)
bjjdata$Submission <- as.factor(bjjdata$Submission)
bjjdata$W.or.L <- as.factor(bjjdata$W.or.L)
bjjdata$move_id <- as.factor(bjjdata$move_id)
bjjdata$match_style <- as.factor(bjjdata$match_style)
# R stores categories as factors which must be changed for proper analysis.
# Rule of thumb if a column is something I wouldn't use an aggregate function then its a factor. For example, match_id denotes a key identifer per match.
```

## Checking new dataframe structure
```{r}
str(bjjdata)
```
## New high level summary check
```{r}
summary(bjjdata)
```

## Avg points scored per match
```{r}
sum(bjjdata$points_scored, na.rm = TRUE) / 5
```
## Avg points gave up per match
```{r}
sum(bjjdata$points_scored_upon, na.rm = TRUE) / 5
```

```{r}
ggplot(data = bjjdata, mapping = aes(y = move_name)) + geom_bar()

```
