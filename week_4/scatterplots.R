install.packages("UsingR")
data(nym.2002, package="UsingR")

# Exercise 1: Use dplyr to create two new data frames: males and females, with 
# the data for each gender. For males, what is the Pearson correlation between 
# age and time to finish?
library(dplyr)
females <- filter(nym.2002, gender=="Female")
males <- filter(nym.2002, gender=="Male")
cor(males$age, males$time)

# Exercise 2: For females, what is the Pearson correlation between age and 
# time to finish?
cor(females$age, females$time)

# Exercise 3: Look at scatterplots and boxplots of times stratified by age 
# groups (20-25, 25-30, etc..). After examining the data, what is a more 
# reasonable conclusion?

age_groups <- seq(5, 85, by=5)
females$group <- cut(females$age, breaks=age_groups)
males$group <- cut(males$age, breaks=age_groups)

library(rafalib)
mypar(2, 2)
plot(females$age, females$time)
plot(males$age, males$time)
boxplot(time~group, data=females)
boxplot(time~group, data=males)

# => Finish times are constant up through around 50-60, then they get slower.
