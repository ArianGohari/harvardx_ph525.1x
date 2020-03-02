library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

# Exercise 1: What proportion of 1000 sample (n=5) averages are more than
# 1 gram away from the average of x ?
set.seed(1)
n <- 1000
avgs <- vector("numeric", n)
for(i in 1:n) {
  smpl <- sample(x, 5)
  avgs[i] <- mean(smpl)
}

mean(abs(avgs - mean(x)) > 1)

# Exercise 2: What proportion of 10000 sample (n=5) averages are more than
# 1 gram away from the average of x ?
set.seed(1)
n <- 10000
avgs <- vector("numeric", n)
for(i in 1:n) {
  smpl <- sample(x, 5)
  avgs[i] <- mean(smpl)
}

mean(abs(avgs - mean(x)) > 1)

# Exercise 3: What proportion of 1000 sample (n=50) averages are more than
# 1 gram away from the average of x ?
set.seed(1)
n <- 10000
avgs <- vector("numeric", n)
for(i in 1:n) {
  smpl <- sample(x, 50)
  avgs[i] <- mean(smpl)
}

mean(abs(avgs - mean(x)) > 1)