library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- read.csv(filename) 

# Removing the lines that contain missing values
dat <- na.omit( dat )

# Exercise 1: Average weight of all males on control (chow) diet
library(dplyr)
x <- filter(dat, Sex == "M", Diet == "chow") %>% select(Bodyweight) %>% unlist()
avg_x <- mean(x)
avg_x

# Exercise 2: Population (x) standard deviation calculated with rafalib package
install.packages("rafalib")
library("rafalib")
sd_x <- popsd(x)
sd_x

# Exercise 3: Average of random sample (n = 25) from x
set.seed(1)
smpl_x <- sample(x, 25)
avg_smpl_x <- mean(smpl_x)
avg_smpl_x

# Exercise 4: Average weght of all males on high fat diet
y <- filter(dat, Sex == "M", Diet == "hf") %>% select(Bodyweight) %>% unlist()
avg_y <- mean(y)
avg_y

# Exercise 5: Population (y) standard deviation calculated with rafalib package
sd_y <- popsd(y)
sd_y

# Exercise 6: Average of random sample (n = 25) from y
set.seed(1)
smpl_y <- sample(y, 25)
avg_smpl_y <- mean(smpl_y)
avg_smpl_y

# Exercise 7: Difference (absolute value) of avg_smpl_y - avg_smpl_x and avg_y - avg_x
abs((avg_smpl_y - avg_smpl_x) - (avg_y - avg_x))

# Exercise 8: Same as above for females (and seed set to 2)
x_fem <- filter(dat, Sex == "F", Diet == "chow") %>% select(Bodyweight) %>% unlist()
y_fem <- filter(dat, Sex == "F", Diet == "hf") %>% select(Bodyweight) %>% unlist()

sd_x_fem <- popsd(x_fem)
sd_y_fem <- popsd(y_fem)

avg_x_fem <- mean(x_fem)
avg_y_fem <- mean(y_fem)

set.seed(2)
smpl_x_fem <- sample(x_fem, 25)
set.seed(2)
smpl_y_fem <- sample(y_fem, 25)

avg_smpl_x_fem <- mean(smpl_x_fem)
avg_smpl_y_fem <- mean(smpl_y_fem)

abs((avg_smpl_y_fem - avg_smpl_x_fem) - (avg_y_fem - avg_x_fem))

# Exercise 9: Why are sample estimates for females closer to population difference than with males?
# The population variance of the females is smaller than that of the males; thus, the sample variable
# has less variabilty