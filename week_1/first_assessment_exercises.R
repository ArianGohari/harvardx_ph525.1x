# Get swirl library
install.packages("swirl")
library(swirl)

# Exercise 1: R Version
print(version)

# Exercise 2: Numeric vector average:
numbers <- c(2.23, 3.45, 1.87, 2.11, 7.33, 18.34, 19.23)
avg <- mean(numbers)
print(avg)

# Exercise 3: Sum
sum = 0
for (i in 1:25) {
  sum = sum + i^2
}
print(sum)

# Exercise 4: Class of cars
clz <- class(cars)
print(clz)

# Exercise 5: How many rows does the cars oject have?
rows <- nrow(cars)
print(rows)

# Exercise 6: Name of second column of cars
# dist

# Exercise 7: Average distance in cars
avg_dist <- mean(cars[,2])
print(avg_dist)

# Exercise 8: Which row if cars has distance of 85?
dist_85 <- which(cars$dist == 85)
print(dist_85)