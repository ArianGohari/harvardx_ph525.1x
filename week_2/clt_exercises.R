library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- na.omit( read.csv(filename) )

?pnorm

# Exercise 1: Proportion of numbers 1 sd away from average in a normal distribution
pnorm(1) - pnorm(-1)

# Exercise 2: Proportion of numbers 2 sd away from average in a normal distribution
pnorm(2) - pnorm(-2)

# Exercise 3: Proportion of numbers 3 sd away from average in a normal distribution
pnorm(3) - pnorm(-3)

# Exercise 4: What proportion of males on control diet (y) are within 1 sd away 
# from the average weight
library(dplyr)
library(rafalib)
y <- filter(dat, Sex == "M", Diet == "chow") %>% select(Bodyweight) %>% unlist()
avg <- mean(y)
sd <- popsd(y)
z <- (y - avg) / sd
mean(abs(z) <= 1)

# Exercise 5: What proportion of y are within 2 sd away from the average weight
mean(abs(z) <= 2)

# Exercise 6: What proportion of y are within 3 sd away from the average weight
mean(abs(z) <= 3)

# Exercise 7:
qqnorm(z)
abline(0,1)
# The mouse weights are well approximated by te normal distribution, 
# altough the larger values (right tail) are larger than predicted by the normal.
# This is consistent with the differences seen between questions 3 and 6

# Exercise 8:  Explanation for all these mouse weights being well approximated 
# by the normal distribution?
mypar(2,2)
y <- filter(dat, Sex=="M" & Diet=="chow") %>% select(Bodyweight) %>% unlist
z <- ( y - mean(y) ) / popsd(y)
qqnorm(z);abline(0,1)
y <- filter(dat, Sex=="F" & Diet=="chow") %>% select(Bodyweight) %>% unlist
z <- ( y - mean(y) ) / popsd(y)
qqnorm(z);abline(0,1)
y <- filter(dat, Sex=="M" & Diet=="hf") %>% select(Bodyweight) %>% unlist
z <- ( y - mean(y) ) / popsd(y)
qqnorm(z);abline(0,1)
y <- filter(dat, Sex=="F" & Diet=="hf") %>% select(Bodyweight) %>% unlist
z <- ( y - mean(y) ) / popsd(y)
qqnorm(z);abline(0,1)
# This just happens to be how nature behaves in this particular case.
# Perhaps the resulto of many biological factors averaging out


y <- filter(dat, Sex=="M" & Diet=="chow") %>% select(Bodyweight) %>% unlist
set.seed(1)
avgs <- replicate(10000, mean( sample(y, 25)))
mypar(1,2)
hist(avgs)
qqnorm(avgs)
qqline(avgs)
# Exercise 9: What is the average of the distribution of the sample averages (avgs)?
mean(avgs)

# Exercise 10: Standard deviation of avgs:
popsd(avgs)