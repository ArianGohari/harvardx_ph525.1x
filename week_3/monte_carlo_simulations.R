# Exercise 1: t-statistic of random normal distributed sample
set.seed(1)
ttest <- function(N) {
  X <- rnorm(N)
  sqrt(N)*mean(X)/sd(X)
}

ttest(5)

# Exercise 2: Generate  𝐵=1000  t-statistics as done in exercise 1. 
# What proportion is larger than 2?
set.seed(1)
B <- 1000
mean(replicate(B, ttest(5)) > 2)

# Exercise 3: 
B <- 100
ps <- seq(1/(B+1), 1-1/(B+1),len=B)
quantiles <- qt(ps,df=4)
Ns <- seq(5,30,5)

# For which sample sizes does the approximation best work?
for (N in Ns) {
  ttests <- replicate(B, ttest(N))
  qqplot(ttests, quantiles)
  abline(0, 1)
}

# The approximations are spot on for all sample sizes.

# Exercise 4:  t-statistic comparing two means and obtained with normally 
# distributed (mean 0 and sd) data follows a t-distribution
Ns<-seq(5,30,5)
B <- 1000
mypar(3,2)
LIM <- c(-4.5,4.5)
for(N in Ns){
  ts <- replicate(B,{
    x <- rnorm(N)
    y <- rnorm(N)
    t.test(x,y, var.equal = TRUE)$stat
  })
  ps <- seq(1/(B+1),1-1/(B+1),len=B)
  qqplot(qt(ps,df=2*N-2),ts,main=N,
         xlab="Theoretical",ylab="Observed",
         xlim=LIM, ylim=LIM)
  abline(0,1)
}  

# Exercise 5:
set.seed(1)
N <- 15
B <- 10000
tstats <- replicate(B,{
  X <- sample(c(-1,1), N, replace=TRUE)
  sqrt(N)*mean(X)/sd(X)
})
ps=seq(1/(B+1), 1-1/(B+1), len=B) 
qqplot(qt(ps,N-1), tstats, xlim=range(tstats))
abline(0,1)

# Exercise 6:
# t-statistic sqrt(N)*mean(X)/sd(X) is approximated by a 
# t-distribution with 999 degrees of freedom ?
# 
# true

# Exercise 7:
set.seed(1)
Ns <- seq(5,45,5)
library(rafalib)
mypar(3,3)
for(N in Ns){
  medians <- replicate(10000, median ( rnorm(N) ) )
  title <- paste("N=",N,", avg=",round( mean(medians), 2) , ", sd*sqrt(N)=", round( sd(medians)*sqrt(N),2) )
  qqnorm(medians, main = title )
  qqline(medians)
}

