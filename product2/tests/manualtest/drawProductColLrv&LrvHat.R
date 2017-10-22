# setwd() to the dir where the script have been stored
if (!require("rstudioapi"))
  install.packages("rstudioapi")
library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
# Loading the functions
#source("sourceAll.R")
size = 100
replicationCount = getReplicationCountFromSampleSize(size)

psi = 0.5
# psi = 0 # makes it iid
sigma = 1
mean = 0

cMatrix <- createCMatrix(size = size,
                         psi = psi,
                         sigma = sigma)

lrvProductColReplicated = cMatrix [1,] + 2 * cMatrix [2,]
xArray <- 1:(size-1)
NlrvProductColReplicatedHat <- 5
lrvProductColReplicatedHatArray <- matrix(0, nrow = size - 1,ncol = NlrvProductColReplicatedHat)
subtitle <- paste("lag\n","size=replicationcount = ",size,"\npsi = ",psi,
                  ", sigma = ", sigma, ", mean = ", mean)
for(index in 1:NlrvProductColReplicatedHat)
{


  originalReplicated <- createOriginalMA1Replicated(replicationCount = replicationCount,
                                                    size = size,
                                                    psi = psi,
                                                    sigma = sigma)
  productColReplicated <- createProductColReplicated(originalReplicated = originalReplicated)
  lrvHat <- createLRVof3dArray(array3d = productColReplicated)
  fileName <- "productCol_lrvHatTemp"
  fileName <- paste(fileName,index,sep = "_")
  saveJpg(fileName,"./plots/")
  plot(lrvHat~xArray,type = "l", col = "blue",xlab = "")
  lines(lrvProductColReplicated~xArray,col = "red")
  title(main = "ProductColLrvHat",sub = subtitle )
  graphics.off()
  lrvProductColReplicatedHatArray[,index] <- lrvHat
}
df <- data.frame(lrvProductColReplicated,lrvProductColReplicatedHatArray)
max <- max(df)
min <- min(df)
saveJpg("productCol_lrv","./plots/")
plot(lrvProductColReplicated ~ xArray, type = "l",col = "red",ylim = c(min,max),xlab  = "")
title(main="ProductCol lrv & lrvHat",sub = subtitle)
lineArray <- c("ProductColLRV","ProductColLRVHat")
legend("topright",
       title = "LRV",
       lineArray,
       fill = c("red","blue"))
for(index in 1:NlrvProductColReplicatedHat)
{
  lines( lrvProductColReplicatedHatArray[,index]~xArray,col="blue")
}
graphics.off()