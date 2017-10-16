# Bootstrap 95% CI for R-Squared
library(boot)
# function to obtain R-Squared from the data
rsq <- function(formula, data, indices) {
  d <- data[indices,] # allows boot to select sample
  fit <- lm(formula, data = d)
  return(summary(fit)$r.square)
}

# bootstrapping with 1000 replications
results <- boot(data = mtcars,
                statistic = rsq,
                formula = mpg ~ wt + disp,
                R = 100)

# view results
results$t0
results$t
results$data
results$seed
results$strata
results$sim

plot(results)

# get 95% confidence interval
boot.ci(results, type="norm")

boot.ci(results, type="basic")

boot.ci(results, type="perc")



###########################


hsb2<-read.table("http://www.ats.ucla.edu/stat/data/hsb2.csv", sep=",", header=T)

hsb2
# Using the boot command
# 
# The boot command executes the resampling of your dataset and calculation of your statistic(s) of interest on these samples.  Before calling boot, you need to define a function that will return the statistic(s) that you would like to bootstrap.  The first argument passed to the function should be your dataset.  The second argument can be an index vector of the observations in your dataset to use or a frequency or weight vector that informs the sampling probabilities.  The example below uses the default index vector and assumes we wish to use all of our observations. The statistic of interest here is the correlation coefficient of write and math.

fc <- function(d, i){
  d2 <- d[i, ]
  return(cor(d2$math, d2$write))
}


# With the function fc defined, we can use the boot command, providing our dataset name, our function, and the number of bootstrap samples to be drawn.

bootcorr <- boot(hsb2, fc, R = 500)
bootcorr$t0
bootcorr$t
boot.ci(bootcorr)

summary(bootcorr)

# Knowing the seed value would allow us to replicate this analysis, if needed,
# and from the t vector and t0, we could calculate the bias and standard error:
  
mean(bootcorr$t) - bootcorr$t0

sd(bootcorr$t)

class(bootcorr)

# Bootstrap confidence intervals and plots

plot(bootcorr)
# Using the boot.ci command, you can generate several types of confidence intervals from your bootstrap samples.
boot.ci(boot.out = bootcorr, type = c("norm", "basic", "perc", "bca"))

# Four 95% confidence intervals are presented: normal, basic,
# percentile, # and bias-corrected and accelerated. 
# A fifth type, the studentized intervals,
# requires variances from each bootstrap sample.
