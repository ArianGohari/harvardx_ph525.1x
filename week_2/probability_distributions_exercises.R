install.packages("gapminder")

library(gapminder)
data(gapminder)
head(gapminder)

# Exercise 1: Proportion of countries in 1952 that have a life expectancy less than or equal 40?
library(dplyr)
life_exps_1952 <- filter(gapminder, year == 1952)  %>% select(lifeExp) %>% unlist()
mean(life_exps_1952 <= 40)

# Exercise 2: Proportion of countries in 1952 that have a life expectancy between 40 and 60?
mean(life_exps_1952 <= 60) - mean(life_exps_1952 <= 40)