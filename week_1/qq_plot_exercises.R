load("skew.RData")
dim(dat)

par(mfrow = c(3,3))

for (i in 1:9) {
  qqnorm(dat[,i])
  qqline(dat[,i])
}

par(mfrow = c(1,1))

# Exercise 1: Which column has a positive skew?
# 4

# Exercise 2: Which column has a negative skew?
# 9