library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv"
if(!file.exists("femaleMiceWeights.csv")) download(url,destfile=filename)
dat <- read.csv(filename)

# Exercise 1:
set.seed(1)
n <- 100
sides <- 6
p <- 1/sides
zs <- replicate(10000,{
  x <- sample(1:sides,n,replace=TRUE)
  (mean(x==6) - p) / sqrt(p*(1-p)/n)
}) 
qqnorm(zs)
abline(0,1)#confirm it's well approximated with normal distribution
mean(abs(zs) > 2)

# Exercise 2:
ps <- c(0.5,0.5,0.01,0.01)
ns <- c(5,30,30,100)
library(rafalib)
mypar(4,2)
for(i in 1:4){
  p <- ps[i]
  sides <- 1/p
  n <- ns[i]
  zs <- replicate(10000,{
    x <- sample(1:sides,n,replace=TRUE)
    (mean(x==1) - p) / sqrt(p*(1-p)/n)
  }) 
  hist(zs,nclass=7)
  qqnorm(zs)
  abline(0,1)
}

# Exercse 3:
X <- filter(dat, Diet=="chow") %>% select(Bodyweight) %>% unlist
Y <- filter(dat, Diet=="hf") %>% select(Bodyweight) %>% unlist
X_avg <- mean(X)
X_avg

# Exercise 6:
X_sd <- sd(X)
X_sd

# Exercise 7:
2 * ( 1-pnorm(2/ X_sd * sqrt(12) ) )

# Exercise 8:
Y_sd <- sd(Y)
se <- sqrt((Y_sd^2)/12 + (X_sd^2)/12)
se

# Exercise 9:
Y_avg <- mean(Y)
obs <- (Y_avg - X_avg)
t <- obs / se
t

# Exercise 11: P-value with CLT if null distribution is true
p <- 2 * (1 - (pnorm(t)))
p

# Exercise 12:
t_2 <- t.test(X, Y)
t_2