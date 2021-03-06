# Week 4 Assignment - Distribution of Random Variables
# Student: Kalyan (Kalyanaraman Parthasarathy)

# Clear the console
cat("\014")

download.file("http://www.openintro.org/stat/data/bdims.RData", destfile = "bdims.RData")
load("bdims.RData")

head(bdims)

mdims <- subset(bdims, sex == 1)
fdims <- subset(bdims, sex == 0)

# Exercise 1: Make a histogram of men’s heights and a histogram of women’s heights. How would you compare the various aspects of the two distributions?

mhgtmean <- mean(mdims$hgt)
mhgtsd   <- sd(mdims$hgt)

hist(mdims$hgt, probability = TRUE)
x <- 140:190
y <- dnorm(x = x, mean = mhgtmean, sd = mhgtsd)
lines(x = x, y = y, col = "red")

hist(fdims$hgt, probability = TRUE)
x <- 140:190
y <- dnorm(x = x, mean = fhgtmean, sd = fhgtsd)
lines(x = x, y = y, col = "blue")

# Answer: Based on the histograms, both distributions appear to be a normal distributions

# Exercise 2: Based on the this plot, does it appear that the data follow a nearly normal distribution?

fhgtmean <- mean(fdims$hgt)
fhgtsd   <- sd(fdims$hgt)

hist(fdims$hgt, probability = TRUE)
x <- 140:190
y <- dnorm(x = x, mean = fhgtmean, sd = fhgtsd)
lines(x = x, y = y, col = "blue")

qqnorm(fdims$hgt)
qqline(fdims$hgt)

# Answer: Yes, based on the histogram as well as the Q-Q Plot, the distribution of female heights appear to be normally distributed


# Exercise 3: Make a normal probability plot of sim_norm. Do all of the points fall on the line? How does this plot compare to the probability plot for the real data?

sim_norm <- rnorm(n = length(fdims$hgt), mean = fhgtmean, sd = fhgtsd)
qqnorm(sim_norm,main="QQ Plot simulated Data")
qqline(fdims$hgt)

# Answer: The simulation does not appear to be normally distributed compated to the original data. There are lots of data that do not fall on/near the line


# Exercise 4: Does the normal probability plot for fdims$hgt look similar to the plots created for the simulated data? 
# That is, do plots provide evidence that the female heights are nearly normal?

qqnormsim(fdims$hgt)

# Answer: Yes, the simulated models appear to be normal so the female data appears to be normally distributed


# Exercise 5: Using the same technique, determine whether or not female weights appear to come from a normal distribution.

qqnormsim(fdims$wgt)

# Answer: Yes, the weight also appears to be normal


# Exercise 6: Write out two probability questions that you would like to answer; 
# one regarding female heights and one regarding female weights. 
# Calculate the those probabilities using both the theoretical normal distribution 
# as well as the empirical distribution (four probabilities in all). 
# Which variable, height or weight, had a closer agreement between the two methods?

# Question 1: What is the probability that the average height of the female aged less than 20 are more than 160 cms
fdimsNew <- subset(bdims, sex == 0 & age <= 20)
fhgtmeanNew <- mean(fdimsNew$hgt)
fhgtsdNew   <- sd(fdimsNew$hgt)

pnorm(q =160, mean = fhgtmeanNew, sd = fhgtsdNew)

sum(fdimsNew$hgt<160)/length(fdimsNew$hgt)

# Answer: The probability is 0.2291 (22.91%)

# Question 2: What is the probability that the weight of the female aged more than 35, are more than 65 kgs
fdimsNew2 <- subset(bdims, sex == 0 & age > 35)
fhgtmeanNew2 <- mean(fdimsNew2$wgt)
fhgtsdNew2   <- sd(fdimsNew2$wgt)

pnorm(q=65, mean = fhgtmeanNew2, sd = fhgtsdNew2)

sum(fdimsNew2$wgt>65)/length(fdimsNew2$wgt)

# Answer: The probability is 0.3158 (31.58%)


