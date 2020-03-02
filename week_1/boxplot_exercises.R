head(InsectSprays)

# Boxplot using split
boxplot(split(InsectSprays$count, InsectSprays$spray))

# Boxplot using a formula
boxplot(InsectSprays$count ~ InsectSprays$spray)

# Exercise 1: Which spray seems the most effectiveß
# C

# Exercise 2: Use boxplots and historgrams to compare the finishing times of males and females
# Result: Males and females have simiar right skewed distributions with the former,
# 20 minutes shifted to the left
library(dplyr)
data(nym.2002, package = "UsingR")

boxplot(nym.2002$time ~ nym.2002$gender)
male_times <- filter(nym.2002, gender == "Male") %>% select(time) %>% unlist()
female_times <- filter(nym.2002, gender == "Female") %>% select(time) %>% unlist()
par(mfrow=c(1,2))
hist(male_times)
hist(female_times)