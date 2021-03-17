d = read.csv("assoctest.csv")
tbl <- table(d)

# Exercise 1: Chi-square test
chisq.test(tbl)

# Exercise 2: Fisher's exact test
fisher.test(tbl)
