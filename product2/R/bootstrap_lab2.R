library(boot) #load the package
# Now we need the function we would like to estimate
# In our case the beta:
betfun = function(data, b, formula) {  
  # b is the random indexes for the bootstrap sample
  d = data[b,] 
  return(lm(d[,1]~d[,2], data = d)$coef[2])  
  # thats for the beta coefficient
}
# now you can bootstrap:
bootbet = boot(data = as.data.frame(originalReplicated),
               statistic = betfun,
               R = 100) 
# R is how many bootstrap samples
names(bootbet)
plot(bootbet)
hist(bootbet$t, breaks = 100)



zoombot = boot.array(bootbet, indices = T)
dim(zoombot)
hist(zoombot[1,], breaks = 100) 
# this is the frequency of each index, [1,] for the first
#bootstrap run


nb = 100 ; bet = NULL ; n = NROW("your data here")
ptm <- proc.time() # have a look at the time it takes
for (i in 1:nb){
  unifnum = sample(c(1:n),n,replace = T)	# pick random indices
  bet[i] = lm(data[unifnum,1]~data[unifnum,2])$coef[2]
}
proc.time() - ptm # about 80 seconds on my end


library(quantmod) ; library(xtable) ; library(tseries)
library(ggplot2) ; library(fields) ; library(grDevices)
tckr = c('MS', 'SPY')
end<- format(Sys.Date(),"%Y-%m-%d") # yyyy-mm-dd
start<-format(Sys.Date() - 365*10,"%Y-%m-%d") # 10 years of data
dat1 = (getSymbols(tckr[1], src="yahoo", from=start, to=end, auto.assign = FALSE))
dat2 = (getSymbols(tckr[2], src="yahoo", from=start, to=end, auto.assign = FALSE))
ret1 = as.numeric((dat1[,4] - dat1[,1])/dat1[,1] )
ret2 = as.numeric((dat2[,4] - dat2[,1])/dat2[,1])
plot(ret1)
length(as.numeric(ret1)) ; length(as.numeric(ret1))
plot(as.numeric(ret1)~as.numeric(ret2))
t1 = as.data.frame(cbind(as.numeric(ret1),as.numeric(ret2)))
names(t1) <- tckr
lm1 = lm(MS~SPY, data = t1) ; summary(lm1)
nb = 5000 ; bet = NULL ; n = NROW(t1)
ptm <- proc.time()
for (i in 1:nb){
  unifnum = sample(c(1:n),n,replace = T)	
  bet[i] = lm(t1[unifnum,1]~t1[unifnum,2])$coef[2]
}
proc.time() - ptm
den = density(bet)
par(mfrow = c(1,1))
bethat <- bquote(Histogram~of ~bold(widehat(beta))) 

h = hist(bet, breaks = 100, freq = NULL, probability = F, ylim = c(0,280), xlab = expression(bold(widehat(beta))),
         , cex.lab = 1.6, main =   bethat ) 
lwd1 = 2.5
xline(mean(bet), col = 4, lwd = lwd1) ; xline(lm1$coef[2], col = 6, lwd = lwd1)
xline(mean(bet)+1.96*summary(lm1)$coef[2,2], col = 3, lwd = lwd1) 
xline(mean(bet)-1.96*summary(lm1)$coef[2,2], col = 3, lwd = lwd1)
xline(quantile(bet,.025), col = 2, lwd = lwd1) ; xline(quantile(bet,.975), col = 2, lwd = lwd1)

xfit<-seq(min(bet),max(bet),length=length(bet))
yfit<-dnorm(xfit,mean=mean(bet),sd=sd(bet))
yfit <- yfit*diff(h$mids[1:2])*length(bet)
lines(xfit, yfit, col="blue", lwd=2)
yfit2<-dnorm(xfit,mean=lm1$coef[2],sd=summary(lm1)$coef[2,2])
yfit2 <- yfit2*diff(h$mids[1:2])*length(bet)
lines(xfit, yfit2, col=5, lwd=2)
###################################################
### Now I generate actually from the normal distribution
###################################################
eps = rnorm(n, mean(ret1), sd(ret1))
fakey = summary(lm1)$coef[1,1]+summary(lm1)$coef[2,1]*ret1 +eps
# hist(fakey, offset=0.16, width=0.13, add=TRUE, col = "green", breaks = 200)
lm2 = lm(fakey~ret1)
fakebet = NULL
ptm <- proc.time()
for (i in 1:nb){
  unifnum = sample(c(1:n),n,replace = T)	
  fakebet[i] = lm(fakey[unifnum]~ret1[unifnum])$coef[2]
}
proc.time() - ptm
fakebethat <- bquote(Histogram~of~fake~bold(widehat(beta)))
h2 = hist(fakebet, breaks = 100, freq = NULL, probability = F, ylim = c(0,470), xlab = expression(bold(widehat(beta))),
          , cex.lab = 1.6, main =   fakebethat ) 
xline(mean(fakebet), col = 4, lwd = lwd1) 
xline(lm2$coef[2], col = 6, lwd = lwd1)
xline(mean(fakebet)+1.96*summary(lm2)$coef[2,2], col = 3, lwd = lwd1) 
xline(mean(fakebet)-1.96*summary(lm2)$coef[2,2], col = 3, lwd = lwd1)
xline(quantile(fakebet,.025), col = 2, lwd = lwd1) ; xline(quantile(fakebet,.975), col = 2, lwd = lwd1)
xfit<-seq(min(fakebet),max(fakebet),length=length(fakebet))
yfit<-dnorm(xfit,mean=mean(fakebet),sd=sd(fakebet))
yfit <- yfit*diff(h2$mids[1:2])*length(fakebet)
lines(xfit, yfit, col="blue", lwd=2)
yfit2<-dnorm(xfit,mean=lm2$coef[2],sd=summary(lm2)$coef[2,2])
yfit2 <- yfit2*diff(h2$mids[1:2])*length(fakebet)


lines(xfit, yfit2, col=5, lwd=2)