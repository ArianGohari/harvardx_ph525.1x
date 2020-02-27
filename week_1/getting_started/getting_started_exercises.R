# Get mice dataset using downloader
install.packages("downloader")
library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv" 
download(url, destfile=filename)

# Exercise 1: Name of the column containing the weights
femaleMiceWeights <- read.csv("~/femaleMiceWeights.csv")
View(femaleMiceWeights)

# Exercise 2: Entry of 12th row and second column
entry <- femaleMiceWeights[12, 2]
print(entry)

# Exercuse 3: Weight of the mose in the 11th row using "$"
weights <- femaleMiceWeights$Bodyweight
weight_11 <- weights[11] 
print(weight_11)

# Exercise 4: How many mice are in the dataset?
n <- length(weights)
print(n)

# Exercise 5: Average weight of mice on high fat diet
hf <- weights[13:24]
hf_avg <- mean(hf)
print(hf_avg)

# Exercise 6: Random sample mouse weight
# ?sample
set.seed(1)
smpl <- sample(13:24, 1)
smpl_weight <- weights[smpl]
print(smpl_weight)