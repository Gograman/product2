if (!require("rstudioapi"))
  install.packages("rstudioapi")
library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
size <- 10
psi = .5
sigma = 1
replicationCountArray <- seq(10,1100,by = 100)

gamma0 = sigma ^ 2 * (1 + psi ^ 2)
gamma1 = psi * sigma^2
lrvOriginal = gamma0 + 2 * gamma1

lrvOriginalArray<-rep(lrvOriginal,length(replicationCountArray))
lrvOriginalHatArray <- numeric(length = length(replicationCountArray))
for(index in 1:length(replicationCountArray))
{
  originalReplicated <- createOriginalMA1Replicated(replicationCount = replicationCountArray[index],
                                                    size = size,
                                                    psi = psi,
                                                    sigma = sigma)
  lrvOriginalHatArray[index] <- createLRVof2dArray(array2d = originalReplicated)
}
df <- data.frame(lrvOriginalHatArray,lrvOriginalArray)
yMax <- max(df)
yMin <- min(df)
saveJpg("origin_lrv_RC","./plots/")
plot(lrvOriginalArray~replicationCountArray,type="c",
     ylim = c(yMin-1,yMax+1),col="blue",xlab="",ylab = "alphaHat")
points(lrvOriginalHatArray~replicationCountArray,pch=20)
title("Origin lrv and lrvHat")
graphics.off()
