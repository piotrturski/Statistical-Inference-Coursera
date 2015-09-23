## Q1
# sample mean variance = population variance/n

## Q2
# normal distribution with mean=80, sd=10; what is the probability that random sample is less than 70
# distribution function
pnorm(70, mean=80, sd=10)

## Q3
# normal dist mean=1100, sd=75. what value irepresents 95th percentile
# quantile function
qnorm(0.95, mean=1100, sd=75)

## Q4
# X: normal dist; mean=1100, sd=75. Y: sample mean of 100 random samples. what's the 95th percentile of the distribution of that sample mean
# Y mean = X mean
# Y Vat = sig^2/n; Y sd = sqrt(Y Var)
qnorm(.95, mean=1100, sd=75/sqrt(100))

## Q5
# what's the probability of getting 4 or 5 heads with 5 flips of fair coins
# dbinom(4, 5, 0.5) + dbinom(5, 5, 0.5)
pbinom(3, 5, 0.5, lower.tail = F) ## more that 3 heads

## Q6
# *not* normal distribution; mean=15, sd = 10; what's the probability that mean of sample of 100 is between 14 and 16
# CTL says that mean sample -> normal distribution when n -> inf
populationMean <- 15
populationSd <- 10
upperBound <- 16
halfRange <- upperBound-populationMean
sampleSize <- 100

sampleSd <- populationSd /sqrt(sampleSize) # calculate sd of sample mean
meanAboveUpperBoundProbabilty <- pnorm(upperBound , populationMean, sampleSd, lower.tail = F)
# mean under lower boud has same probability, so the probabilty that mean is in between:
1 - meanAboveUpperBoundProbabilty * 2 # confidence. assume loverBound is symetric around mean

## Q7
standard uniform density, mean = .5, variance = 1/12. take sample of 1k and calculate mean. near what value will it be
# population mean = sample mean;
0.5

## Q8
# people showing up with mean of 5 people per hour. what's the probability after 3h we see 10 or less people?
# in haskell exact value probability:
# (\x l -> l**x * exp (-l) / product [1..x])
# not equals or less = sum of all
# (\x l -> sum $ map (\x -> l**x * exp(-l) / product [1..x]) [0..x]) 10 (3*5)

ppois(10, 3*5)