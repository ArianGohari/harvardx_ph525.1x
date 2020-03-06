library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )
par(mfrow=c(1,2))
qqnorm(x)
qqline(x)
hist(x)

# make averages5
set.seed(1)
n <- 1000
averages5 <- vector("numeric",n)
for(i in 1:n){
  X <- sample(x,5)
  averages5[i] <- mean(X)
}

# make averages50
set.seed(1)
n <- 1000
averages50 <- vector("numeric",n)
for(i in 1:n){
  X <- sample(x,50)
  averages50[i] <- mean(X)
}

# Exercise 1: How do the distributions differ by histogram?
# They both look roughly normal, but with a sample size of 50 the spread is smaller
par(mfrow=(c(1,2))
hist(averages5)
hist(averages50)

# Exercise 2: Proportion of averages50 between 23 and 25
mean(averages50 <= 25) - mean(averages50 <= 23)

# Exercise 3: Same proportion as in exercise 2 with pnorm()
pnorm(25, 23.9, 0.43) - pnorm(23, 23.9, 0.43)