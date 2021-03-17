data(ChickWeight)
head(ChickWeight)
plot( ChickWeight$Time, ChickWeight$weight, col=ChickWeight$Diet)

chick <- reshape(ChickWeight, idvar=c("Chick","Diet"), timevar="Time",
                direction="wide")

head(chick)
chick <- na.omit(chick)

# Exercise 1:
library(dplyr)
x <- filter(chick, Diet=="1")$weight.4
y <- filter(chick, Diet=="4")$weight.4

t.test(x, y)
wilcox.test(x, y)

t.test(c(x, 200),y)$p.value

# Exercise 2:
wilcox.test(c(x, 200), y)$p.value

# Exercise 3:
library(rafalib)
mypar(1,3)
boxplot(x,y)
boxplot(x,y+10)
boxplot(x,y+100)

t.test(x,y+10)$statistic - t.test(x,y+100)$statistic

# Exercise 4:
wilcox.test(c(1, 2, 3), c(4, 5, 6))$p.value

# Exercise 5:
wilcox.test(c(1, 2, 3), c(400,500,600))$p.value
