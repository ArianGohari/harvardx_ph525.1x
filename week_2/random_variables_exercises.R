library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

# Exercise 1: Average
avg <- mean(x)
print(avg)

# Exercise 2: Abs of sample average - dataset average
set.seed(1)
smpl <- sample(x, 5)
delta <- abs(mean(smpl) - avg)
print(delta)

# Exercise 3: Abs of another sample average - dataset average
set.seed(5)
smpl <- sample(x, 5)
delta <- abs(mean(smpl) - avg)
print(delta)

# Exercise 4: Why are the answers from 2 and 3 different?
# Because the average of the samples is a random value