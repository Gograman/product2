if (!require("rstudioapi"))
  install.packages("rstudioapi")
library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
sizeArray <- seq(10,2000,by = 100)
psi = .5
sigma = 1

fileName <- "origin_lrv_size"
fileName <- timestampGenerator(fileName = fileName)
gamma0 = sigma ^ 2 * (1 + psi ^ 2)
gamma1 = psi * sigma^2
lrvOriginal = gamma0 + 2 * gamma1
subtitle <- paste("replicationCount = size","\npsi = ",psi,", sigma = ",sigma)
lrvOriginalArray<-rep(lrvOriginal,length(sizeArray))
lrvOriginalHatArray <- rep(NA,length(sizeArray))
for(index in 1:length(sizeArray))
{
  replicationCount <- getReplicationCountFromSampleSize(sizeArray[index])
  originalReplicated <- createOriginalMA1Replicated(replicationCount = replicationCount,
                                                    size = sizeArray[index],
                                                    psi = psi,
                                                    sigma = sigma)
  lrvOriginalHatArray[index] <- createLRVof2dArray(array2d = originalReplicated)
  yMax <- max(lrvOriginalHatArray, na.rm = TRUE)
  yMin <- min(lrvOriginalHatArray, na.rm = TRUE)
  saveJpg(fileName,"./plots/")
  plot(lrvOriginalArray~sizeArray,type="l",ylim = c(yMin-0.01,yMax+0.01),col="blue",xlab="",
       ylab = "lrv and LRVHat")
  points(lrvOriginalHatArray~sizeArray,pch=20)
  title("Original lrv and lrvHat",subtitle)
  graphics.off()
}
#yMax <- max(lrvOriginalHatArray)
#yMin <- min(lrvOriginalHatArray)
#saveJpg("origin_lrv_size","./plots/")
#plot(lrvOriginalArray~sizeArray,type="l",ylim = c(yMin-0.01,yMax+0.01),col="blue",xlab="",
#     ylab = "lrv and LRVHat")
#points(lrvOriginalHatArray~sizeArray,pch=20)
#title("Original lrv and lrvHat",subtitle)
#graphics.off()

