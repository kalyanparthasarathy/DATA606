# DATA 606 Chapter 3 Assignment - Distributions of Random Variables
# Student Name: Kalyan (Kalyanaraman Parthasarathy)


# Load the library
library('DATA606')

# Clear the console
cat("\014")

# QUESTION 3.2: 
# Area under the curve, Part II. What percent of a standard normal distribution 
# N(Âµ =0,? = 1) is found in each region? Be sure to draw a graph.

# a. Z > -1.13
normalPlot(mean = 0, sd = 1, bounds = c(-1.13, 4))
print("Percent of a standard normal distribution for the area is 87.07% (0.87076)")

# b. Z < 0.18
normalPlot(mean = 0, sd = 1, bounds = c(-4, 0.18))
print("Percent of a standard normal distribution for the area is 57.14% (0.57142)")

# c. Z > 8
normalPlot(mean = 0, sd = 1, bounds = c(8,12))
print("Percent of a standard normal distribution for the area is 0% (0)")

# d. |Z| < 0.5
normalPlot(mean = 0, sd = 1, bounds = c(-0.5,0.5))
print("Percent of a standard normal distribution for the area is 38.29% (0.38292)")



# QUESTION 3.4: 
# Triathlon times, Part I. In triathlons, it is common for racers to be placed into age
# and gender groups. Friends Leo and Mary both completed the Hermosa Beach Triathlon, where
# Leo competed in the Men, Ages 30 - 34 group while Mary competed in the Women, Ages 25 -
#   29 group. Leo completed the race in 1:22:28 (4948 seconds), while Mary completed the race in
# 1:31:53 (5513 seconds). Obviously Leo finished faster, but they are curious about how they did
# within their respective groups. Can you help them? Here is some information on the performance
# of their groups:
# â¢ The finishing times of the Men, Ages 30 - 34 group has a mean of 4313 seconds with a
# standard deviation of 583 seconds.
# â¢ The finishing times of the Women, Ages 25 - 29 group has a mean of 5261 seconds with a
# standard deviation of 807 seconds.
# â¢ The distributions of finishing times for both groups are approximately Normal.
# Remember: a better performance corresponds to a faster finish.
# (a) Write down the short-hand for these two normal distributions.
# (b) What are the Z-scores for Leoâs and Maryâs finishing times? What do these Z-scores tell you?
# (c) Did Leo or Mary rank better in their respective groups? Explain your reasoning.
# (d) What percent of the triathletes did Leo finish faster than in his group?
# (e) What percent of the triathletes did Mary finish faster than in her group?
# (f) If the distributions of finishing times are not nearly normal, would your answers to parts
# (b) - (e) change? Explain your reasoning.

# (a) Write down the short-hand for these two normal distributions.
mean_leo <- 4313
observation_leo <- 4948
sd_leo <- 583
z_score <- (observation_leo - mean_leo)/sd_leo
print(paste("Z Score for Leo is: ", round(z_score, 4)))
# Leo: Mean(Î¼)=4313, sd(Ï)=583, x=4948 so Z = (x-Î¼)/Ï = (4948-4313)/583 = 1.0891
print("Z score is 1.0892")

mean_mary <- 5261
observation_mary <- 5513
sd_mary <- 807
z_score <- (observation_mary - mean_mary)/sd_mary
print(paste("Z Score for Mary is: ", round(z_score, 4)))
# Mary: Mean(Î¼)=5261, sd(Ï)=807, x=5513 so Z = (x-Î¼)/Ï = (5513-5261)/807 = 0.3123
print("Z score is 0.3123")


# (b) What are the Z-scores for Leoâs and Maryâs finishing times? What do these Z-scores tell you?
print("Based on the Z scores, it appears that Mary performed better than Leo")


# (c) Did Leo or Mary rank better in their respective groups? Explain your reasoning.
print("Mary performed better in her group. Her score is within 0.3 standard deviation whereas Leo's score falls within 1.09 standard deviation")


# (d) What percent of the triathletes did Leo finish faster than in his group?
normalPlot(mean=mean_leo,sd=sd_leo,bounds=c(observation_leo,mean_leo+(4*sd_leo))) 
print("13.79% (0.13786)")


# (e) What percent of the triathletes did Mary finish faster than in her group?
normalPlot(mean=mean_mary,sd=sd_mary,bounds=c(observation_mary,mean_mary+(4*sd_mary))) 
print("37.83% (0.37828)")


# (f) If the distributions of finishing times are not nearly normal, would your answers to parts (b) - (e) change? Explain your reasoning
print("If the distributions are not normal, then the values may not hold true for Mary and Leo")


# QUESTION 3.18:
# Heights of female college students. Below are heights of 25 female college students.
# 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25
# 54,55,56,56,57,58,58,59,60,60,60,61,61,62,62,63,63,63,64,65,65,67,67,69,73
# (a) The mean height is 61.52 inches with a standard deviation of 4.58 inches. Use this information
# to determine if the heights approximately follow the 68-95-99.7% Rule.
# (b) Do these data appear to follow a normal distribution? Explain your reasoning using the graphs
# provided below.


# (a) The mean height is 61.52 inches with a standard deviation of 4.58 inches. Use this information
# to determine if the heights approximately follow the 68-95-99.7% Rule.
heights <- c(54,55,56,56,57,58,58,59,60,60,60,61,61,62,62,63,63,63,64,65,65,67,67,69,73)
meanHeights = mean(heights)
sdHeights = sd(heights)
zScores <- (heights - meanHeights) / sdHeights
hist(zScores, col="white", freq=F, xlim=c(-5, 5))
curve(dnorm, -3, 3, add=T, col="blue") # 99.7% Rule
curve(dnorm,-2,2,add=T, col="red") # 95% Rule
curve(dnorm,-1,1,add=T, col="orange") # 68% Rule

print("Yes, the data set follows the 68-95-99.7 rule")


# (b) Do these data appear to follow a normal distribution? Explain your reasoning using the graphs
# provided below.

print("Yes, the data appears to follow normal distribution because 65% of the data falls within one SD, 95% of the data fall within 2 SD and 99.7% of the data fall within 3 SD")



# QUESTION 3.22:
# Defective rate. A machine that produces a special type of transistor (a component of
# computers) has a 2% defective rate. The production is considered a random process where each
# transistor is independent of the others.
# (a) What is the probability that the 10 th transistor produced is the first with a defect?
# (b) What is the probability that the machine produces no defective transistors in a batch of 100?
# (c) On average, how many transistors would you expect to be produced before the first with a
# defect? What is the standard deviation?
# (d) Another machine that also produces transistors has a 5% defective rate where each transistor
# is produced independent of the others. On average how many transistors would you expect to
# be produced with this machine before the first with a defect? What is the standard deviation?
# (e) Based on your answers to parts (c) and (d), how does increasing the probability of an event
# affect the mean and standard deviation of the wait time until success?

# (a) What is the probability that the 10 th transistor produced is the first with a defect?
n <- 10
p <- 0.02
q <- 0.98
print(paste("Probability that the 10 th transistor produced is the first with a defect is:", round(((q ^ (n-1)) * p)*100, 2), "%" ))


# (b) What is the probability that the machine produces no defective transistors in a batch of 100?
n <- 100
p <- 0.02
q <- 0.98
print(paste("Probability that the machine produces no defective transistors in a batch of 100:", round((q ^ n)*100, 2), "%" ))


# (c) On average, how many transistors would you expect to be produced before the first with a
# defect? What is the standard deviation?
p <- 0.02
q <- 0.98
print( paste("Number of transistors produced before the first with a defect:", (1/p)))
print(paste("Standard Deviation: ", round(sqrt(q/(p^2)), 3) ))


# (d) Another machine that also produces transistors has a 5% defective rate where each transistor
# is produced independent of the others. On average how many transistors would you expect to
# be produced with this machine before the first with a defect? What is the standard deviation?
p <- 0.05
q <- 0.95
print( paste("Number of transistors produced before the first with a defect:", (1/p)))
print(paste("Standard Deviation: ", round(sqrt(q/(p^2)), 3) ))


# (e) Based on your answers to parts (c) and (d), how does increasing the probability of an event
# affect the mean and standard deviation of the wait time until success?
print("Each percentage of increase in defective units production has a significant impact in Standard Deviation of the transistors produced with defective")
print("i.e. the first successful production greatly reduces and the standard deviation also gets reduced")



# QUESTION 3.38:
# Male children. While it is often assumed that the probabilities of having a boy or a girl
# are the same, the actual probability of having a boy is slightly higher at 0.51. Suppose a couple
# plans to have 3 kids.
# (a) Use the binomial model to calculate the probability that two of them will be boys.
# (b) Write out all possible orderings of 3 children, 2 of whom are boys. Use these scenarios to
# calculate the same probability from part (a) but using the addition rule for disjoint outcomes.
# Confirm that your answers from parts (a) and (b) match.
# (c) If we wanted to calculate the probability that a couple who plans to have 8 kids will have
# 3 boys, briefly describe why the approach from part (b) would be more tedious than the
# approach from part (a).

# (a) Use the binomial model to calculate the probability that two of them will be boys.
n <- 3
k <- 2
p <- 0.51
q <- 0.49
print( paste("Probability that two of them will be boys is: ", round((factorial(n)/(factorial(k) * factorial(n-k))) * (p^k) * (q^(n-k)) * 100, 2), "%"))

# (b) Write out all possible orderings of 3 children, 2 of whom are boys. Use these scenarios to
# calculate the same probability from part (a) but using the addition rule for disjoint outcomes.
pBoy = 0.51
pGirl = 0.49
pByAddition <- (pBoy * pBoy * pGirl) + (pBoy * pGirl * pBoy) + (pGirl * pBoy * pBoy)
print(paste("Probability that two of them will be boys using addition rule is: ", round(pByAddition * 100, 2), "%. The result matches between (a) and (b)"))

# (c) If we wanted to calculate the probability that a couple who plans to have 8 kids will have
# 3 boys, briefly describe why the approach from part (b) would be more tedious than the
# approach from part (a).
# Using approach b, we have to calculate all the possibilities manually however we can use the formula and find the probability easily if we use approach (a)
n <- 8
k <- 3
p <- 0.51
q <- 0.49
print( paste("Probability that three of them will be boys (of 8 kids) is: ", round((factorial(n)/(factorial(k) * factorial(n-k))) * (p^k) * (q^(n-k)) * 100, 2), "%"))


# QUESTION 3.42:
# Serving in volleyball. A not-so-skilled volleyball player has a 15% chance of making the
# serve, which involves hitting the ball so it passes over the net on a trajectory such that it will land
# in the opposing team’s court. Suppose that her serves are independent of each other.
# (a) What is the probability that on the 10 th try she will make her 3 rd successful serve?
# (b) Suppose she has made two successful serves in nine attempts. What is the probability that
# her 10 th serve will be successful?
# (c) Even though parts (a) and (b) discuss the same scenario, the probabilities you calculated
# should be different. Can you explain the reason for this discrepancy?

# (a) What is the probability that on the 10 th try she will make her 3 rd successful serve?
n <- 10
k <- 3
p <- 0.15
q <- 0.85
print( paste("Probability that on the 10 th try she will make her 3rd successful serve is: ", round((factorial(n)/(factorial(k) * factorial(n-k))) * (p^k) * (q^(n-k)) * 100, 2), "%"))


# (b) Suppose she has made two successful serves in nine attempts. What is the probability that
# her 10 th serve will be successful?
n <- 1
k <- 1
p <- 0.15
q <- 0.85
print( paste("Probability of making the 10th serve successful is: ", round((factorial(n)/(factorial(k) * factorial(n-k))) * (p^k) * (q^(n-k)) * 100, 2), "%"))

# (c) Even though parts (a) and (b) discuss the same scenario, the probabilities you calculated
# should be different. Can you explain the reason for this discrepancy?
print("On (a) we calculated the probabilities of success as 3 in 10 attempts whereas in (b), the probability is calculated only for the last attempt being successful so k becomes 1 and n also becomes 1")

