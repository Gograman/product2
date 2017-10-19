if (!require("rstudioapi"))
  install.packages("rstudioapi")
library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
sizeArray <- seq(10,1100,by = 100)
psi = .5
sigma = 1
replicationCount <- 5

gamma0 = sigma ^ 2 * (1 + psi ^ 2)
gamma1 = psi * sigma^2
lrvOriginal = gamma0 + 2 * gamma1

lrvOriginalArray<-rep(lrvOriginal,length(sizeArray))
lrvOriginalHatArray <- numeric(length = length(sizeArray))
for(index in 1:length(sizeArray))
{
  originalReplicated <- createOriginalMA1Replicated(replicationCount = replicationCount,
                                                    size = sizeArray[index],
                                                    psi = psi,
                                                    sigma = sigma)
  lrvOriginalHatArray[index] <- createLRVof2dArray(array2d = originalReplicated)
}
yMax <- max(lrvOriginalHatArray)
yMin <- min(lrvOriginalHatArray)
saveJpg("origin_lrv_size","./plots/")
plot(lrvOriginalArray~sizeArray,type="c",ylim = c(yMin-1,yMax-1),col="blue",xlab="",ylab = "alphaHat")
points(lrvOriginalHatArray~sizeArray,pch=20)
title("Origin lrv and lrvHat")
graphics.off()
