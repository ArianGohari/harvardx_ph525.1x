data(nym.2002, package="UsingR")
time = sort(nym.2002$time)

# Exercise 1: Fastest time divided by the median time
min(time) / median(time)

# Exercise 2: Slowet time divided by the median time
max(time) / median(time)


# Compare the following two plots
plot(time/median(time), ylim=c(1/4,4))
abline(h=c(1/2,1,2))

plot(log2(time/median(time)),ylim=c(-2,2))
abline(h=-1:1)
