
# Bootstrap

x <- c(1,5:9)
x

median(x)

# 20 replications of bootstrap samples

resampled <- matrix(sample(x = x, size = length(x) * 20, replace = TRUE),
                    nrow = length(x))
resampled

# Calculate median for each replicate

medians <- apply(resampled, 2, median)
summary(medians)

library(lattice)
densityplot(medians, width = 2)

# 95% confidence interval by quantile method
quantile(medians, c(0.025, 0.975))


# 1000 replications
resampled <- matrix(sample(x, size = length(x) * 1000, replace = TRUE), nrow = length(x))
medians  <- apply(resampled, 2, median)
summary(medians)


densityplot(medians, width = 2)


## 95% confidence interval for median by bootstrap quantile method
quantile(medians, c(0.025, 0.975))


## 95% confidence interval for median by asymptotic method
median(x) + c(-1,1) * qnorm(0.975) * sd(medians)


library(boot)

# Define a median function for bootstrapping 
# Define a function that takes the original data as the first argument 
# and a vector of indices as the second argument.

fun.boot <- function(x, i) {
  median(x[i])
}

res.boot <- boot(data = x, statistic = fun.boot, R = 1000)

plot(res.boot)

# Bootstrap confidence intervals

# These are the first order normal approximation (norm), 
# the basic bootstrap interval (basic), 
# the studentized bootstrap interval (stud), 
# the bootstrap percentile interval (perc), 
# and the adjusted bootstrap percentile interval (bca).

# Normal approximation interval
boot.ci(boot.out = res.boot, conf = 0.95, type = "norm")

# Basic bootstrap interval
boot.ci(boot.out = res.boot, conf = 0.95, type = "basic")

# Percentile interval
boot.ci(boot.out = res.boot, conf = 0.95, type = "perc")

# Adjusted percentile interval
boot.ci(boot.out = res.boot, conf = 0.95, type = "bca")


library(car)
library(MASS)
data(Duncan)
head(Duncan)

# Fit a linear model by robust regression using an M estimator The coefficient standard errors reported by rlm rely on asymptotic approximations, and may not be trustworthy in a sample of size 45.

mod.duncan.hub <- rlm(prestige ~ income + education, data=Duncan)
summary(mod.duncan.hub, cor = T)

boot.huber <- function(x, i, maxit = 30) {
  ## Select observations by row numbers
  x <- x[i, ]
  ## Fit model
  res.rlm <- rlm(prestige ~ income + education, data = x, maxit = maxit)
  ## Return coefficient vector
  coefficients(res.rlm)
}

# Perform bootstrap

res.boot.rlm <- boot(data = Duncan, statistic = boot.huber, R = 100)
res.boot.rlm

## Coefficient for intercept
plot(res.boot.rlm, index = 1)

## Coefficient for income
plot(res.boot.rlm, index = 2)

## Coefficient for education
plot(res.boot.rlm, index = 3)

## Bootstrap confidence interval for intercept
boot.ci(res.boot.rlm, index = 1, type = c("norm","perc"))

## Bootstrap confidence interval for income
boot.ci(res.boot.rlm, index = 2, type = c("norm","perc"))

## Bootstrap confidence interval for education
boot.ci(res.boot.rlm, index = 3, type = c("norm","perc"))



