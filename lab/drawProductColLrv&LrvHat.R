# setwd() to the dir where the script have been stored
if (!require("rstudioapi"))
  install.packages("rstudioapi")
library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
# Loading the functions
source("sourceAll.R")

replicationCount = 50
size = 10
psi = .5
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
for(index in 1:NlrvProductColReplicatedHat)
{

  originalReplicated <- createOriginalMA1Replicated(replicationCount = replicationCount,
                                                    size = size,
                                                    psi = psi,
                                                    sigma = sigma)
  productColReplicated <- createProductColReplicated(originalReplicated = originalReplicated,
                                                     size = size,
                                                     replicationCount = replicationCount)
  lrvHat <- createLRVof3dArray(array3d = productColReplicated)
  fileName <- "productCol_lrvHatTemp"
  fileName <- paste(fileName,index,sep = "_")
  saveJpg(fileName,"./plots/")
  plot(lrvHat~xArray,type = "l", col = "blue",xlab = "size")
  title(main = "ProductColLrvHat")
  graphics.off()
  lrvProductColReplicatedHatArray[,index] <- lrvHat
}
df <- data.frame(lrvProductColReplicated,lrvProductColReplicatedHatArray)
max <- max(df)
min <- min(df)

saveJpg("productCol_lrv","./plots/")
plot(lrvProductColReplicated ~ xArray, type = "l",col = "red",ylim = c(min,max),xlab  = "size")
title(main="ProductCol lrv & lrvHat")
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
