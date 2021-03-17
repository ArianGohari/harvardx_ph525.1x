url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)

bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist

library(rafalib)
mean(bwt.nonsmoke)-mean(bwt.smoke)
popsd(bwt.nonsmoke)
popsd(bwt.smoke)

# Exercise 1: Which of the following is *not* a way to decrease the chance 
# of a type II error?
# 
# X - Find a population for which the null is not true.

# Exercise 2: Repeat t-test
# What proportion of the time do we reject at the 0.05 level?
set.seed(1)

reject <- function(N, alpha) {
  sample_nonsmoke <- sample(bwt.nonsmoke, N)
  sample_smoke <- sample(bwt.smoke, N)
  
  pval <- t.test(sample_nonsmoke, sample_smoke)$p.value
  pval < alpha
} 

power <- function(N, B, alpha = 0.05) {
  rejections <- replicate(B, reject(N, alpha))
  mean(rejections) # 0.096
}

N <- 5
B <- 10000
power(N, B) # 0.096

# Exercise 3: Repeat power calculation with sample sizes of 30, 60, 90, 120
# Which of those four gives you power of about 80%?
power(30, B)
power(60, B) # X
power(90, B) 
power(120, B)

# Exercise 4: Repeat the problem above with alpha level of 0.01
power(30, B, alpha=0.01)
power(60, B, alpha=0.01) 
power(90, B, alpha=0.01) # X
power(120, B, alpha=0.01)

