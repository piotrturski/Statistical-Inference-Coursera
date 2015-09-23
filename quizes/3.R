## Q1
# average sample of 9 = 1100, sd = 30; what is 95% student's T confidence interval
# for value in this population

# 95% = P(population mean is within x of sample mean ) = 
#       P(sample mean is within x of population mean) = 
#       P(sample mean is withing x of sample distribution mean)

sampleMean <- 1100
n <- 9
confidence <- 0.95
tquantile <- 1 - (1 - confidence) / 2 # how many standard deviations from the mean
# 0.5 + .confidence / 2 # half for each side
sampleSd <- 30

round(
  sampleMean + c(-1,1) * qt(tquantile, df = n - 1) * sampleSd / sqrt(n)
  )

## Q2

# sample size = 9, average value -2. upper end of 95% T-confidence =0; what's the sample mean sd?

sampleMean <- -2 
n <- 9
confidence <- 0.95
tquantile <- 1 - (1 - confidence) / 2

# sampleMean + 1 * qt(tquantile, df = n - 1) *  sampleSd / sqrt(n) = 0 =>
# sampleSd = - sampleMean * sqrt(n) / qt(tquantile, df = n - 1)

round(
    - sampleMean * sqrt(n) / qt(tquantile, df = n - 1)
, 2) 

## Q4
# compare (95% confidence interval) new and old system (group); 
# 10 independent samples in each group; we have variances of those samples 
# we will assume 'a constant variance' for the purpose of the formula

confidence <- 0.95
newN <- oldN <- 10
newMean <- 3
newVar <- 0.6
oldMean <- 5
oldVariance <- 0.68

tquantile <- 1 - (1 - confidence) / 2
sp <- sqrt(   ((newN-1)*newVar + (oldN-1)*oldVariance)/(newN+oldN-2)   )

round(
    newMean - oldMean + c(-1,1) * qt(tquantile, newN+oldN-2)*sp*sqrt(1/newN+1/oldN)
, 2)

## Q6
# compare (95% confidence interval) new and old system (group); lower is better
# 100 independent samples in each group; we have standard deviations of those samples 
# we will assume 'unequal variances' and Z quantile (because of large sample) for the purpose of the formula

confidence <- 0.95
newN <- oldN <- 100
newMean <- 4
newSd <- 0.5
oldMean <- 6
oldSd <- 2

tquantile <- 1 - (1 - confidence) / 2
interval <- oldMean - newMean + c(-1,1) * qnorm(tquantile) * sqrt(newSd^2/newN + oldSd^2/oldN)
ifelse (all(interval > 0), 
        'interval entirely above zero, so new system is better',
        'no evidence that new system is better')
  
## Q7
# 2 groups (treatment, palcebo) each 9 samples. we have means and sd of the measurements of improvement

confidence <- 0.9
newN <- oldN <- 9
newMean <- -3  # treatment
newSd <- 1.5
oldMean <- 1  # placebo
oldSd <- 1.8

tquantile <- 1 - (1 - confidence) / 2
# formula for equal variances gives same result
# sp <- sqrt(   ((newN-1)*newSd^2 + (oldN-1)*oldSd^2)/(newN+oldN-2)   )
# newMean - oldMean + c(-1,1) * qt(tquantile, newN+oldN-2)*sp*sqrt(1/newN+1/oldN)

round ( digits = 3,
    newMean - oldMean + c(-1,1) * qt(tquantile, newN+oldN-2) * sqrt(newSd^2/newN + oldSd^2/oldN)
)

