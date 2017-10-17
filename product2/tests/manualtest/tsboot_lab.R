# We create some artificial data:
N <- 50                                 # length of the time series
series <- rnorm(N)                      # initially noise
series[-1] <- series[-1] + series[-N]   # introduce auto-correlation
#    
# Here is the code that collects bootstrap values of
# the auto-correlation estimate:
k <- 6                                  # size of moving blocks
nrep <- 1000                            # number of bootstrap replications
lag.cor.bt <- rep(NA,nrep)              # vessel for the boostrapped values
lag.cor.bt
for(irep in 1:nrep) {                   # the bootstrap loop
  series.bt <- rep(NA,N)                # local vector for a bootstrap replication
  for(i in 1:ceiling(N/k)) {            # fill the vector with random blocks
    endpoint <- sample(k:N, size=1)     # by randomly sampling endpoints
    series.bt[(i - 1) * k + 1:k] <- series[endpoint - (k:1) + 1] # and copying blocks
  }
  series.bt <- series.bt[1:N]           # trim overflow when k doesn't divide N
  lag.cor.bt[irep] <- cor(series.bt[-1], series.bt[-N])  # the auto-cor. estimate
  if(irep %% 50 == 0) print(irep)           # report every 50 bootstrap passes
}
#
# Now that we have a bootstrap distribution for the statistic of interest
# in lag.cor.bt, we analyze it.
# First visually:
hist(lag.cor.bt, col="gray", ncl=20)
#
# Then numerically:
# 1) the significance level in terms of the quantile of the value
#    that represents a null assumption (zero in this case):
sum(lag.cor.bt < 0) / 1000

quantile(lag.cor.bt, c(0.025,0.975))

##################################################################













library(tseries)

# Simulate a time series
set.seed(1)
TS <- arima.sim(model = list(ar = c(.8, -.2)), n = 20)
plot(TS)


TSboot = tsbootstrap(TS,
                     m = 1,
                     b = 5,
                     type = "block",
                     nb = 10)

plot(TSboot)



library(boot)
mean.function <-  function(x) {
  mean(x)
}
block.size = 5 # guess at block size

x 	.
nb 	the number of bootstrap series to compute.
statistic 	a function which when applied to a time series returns a vector containing the statistic(s) of interest.
m 	the length of the basic blocks in the block of blocks bootstrap.
b 	if type is "stationary", then b is the mean block length. If type is "block", then b is the fixed block length.
type 	the type of bootstrap to generate the simulated time series. The possible input values are "stationary" (stationary bootstrap with mean block length b) and "block" (blockwise bootstrap with block length b). Default to "stationary".

fixed.block.resampling = tsboot(tseries = TS,
                                # the original data (ts)
                                statistic = mean.function,
                                # a function applied to ts,
                                # returns a vector containing the statistic(s) of interest.
                                R = 999,
                                # the number of bootstrap replicates
                                l = block.size,
                                # the fixed block length
                                sim = "fixed" # block resampling with fixed block lengths of l;
                                # also can be "model" (model based resampling),
                                #             "geom" (block resampling with block lengths
                                #              having a geometric distribution with mean l)
                                #             "scramble" (phase scrambling)
                                )

fixed.block.resampling
replStats = as.vector(fixed.block.resampling$t)
print(summary(replStats)) # for estimate
print(boot.ci(mbb, type = c("norm", "basic", "perc")))



geom.block.resampling = tsboot(tseries = TS,
                               statistic = mean,
                               R = 100,
                               l = 20,
                               sim = "geom",
                               endcorr = TRUE,
                               n.sim = NROW(TS),
                               orig.t = TRUE)
