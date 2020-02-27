# Get dataset
library(downloader)
url="https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
filename <- basename(url)
download(url,filename)

# Get dplyr
install.packages("dplyr")
library(dyplyr)

# Exercise 1: Type of msleep_ggplot2
msleep_ggplot2 <- read.csv("~/msleep_ggplot2.csv")
clz <- class(msleep_ggplot2)
print(clz)

# Exercise 2: How many animals in the table are primates?
primates <- filter(msleep_ggplot2, order=="Primates")
n_primates <- nrow(primates)
print(n_primates)

# Exercise 3: Class of primates object
clz_primates <- class(primates)
print(clz_primates)

# Exercise 4: Class of primates_sleep object using filter, pipe and select
primates_sleep <- filter(msleep_ggplot2, order=="Primates") %>% select(sleep_total)
clz_primates_sleep <- class(primates_sleep)
print(clz_primates_sleep)

# Exercise 5: Average amount of sleep for primates
?unlist
avg_sleep <- mean(unlist(primates_sleep))
print(avg_sleep)

# Exercise 6: Average amount of sleep for primates calculated by summarize()
?summarize
avg_sleep_2 <- filter(msleep_ggplot2, order=="Primates") %>% summarize(mean=mean(sleep_total))
print(avg_sleep_2)