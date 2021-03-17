data(ChickWeight)
head(ChickWeight)
plot( ChickWeight$Time, ChickWeight$weight, col=ChickWeight$Diet)

chick <- reshape(ChickWeight, idvar=c("Chick","Diet"), timevar="Time", 
                 direction="wide")
head(chick)
chick <- na.omit(chick)

# Exercise 1: Mean ratio with -> without outlier
weights_d4 <- chick$weight.4
weights_d4.altered <- c(chick$weight.4, 3000)
mean(weights_d4.altered) / mean(weights_d4)

# Exercise 2: Median ratio with -> without outlier
median(weights_d4.altered) / median(weights_d4)

# Exercise 3: Standard deviation ratio with -> without outlier
sd(weights_d4.altered) / sd(weights_d4)

# Exercise 4: MAD ratio with -> without outler
mad(weights_d4.altered) / mad(weights_d4)

# Exercise 5: Correlation ratio with -> witout outlier
plot(weights_d4, chick$weight.21)
cor(weights_d4.altered, c(chick$weight.21, 3000)) / cor(weights_d4, chick$weight.21)
