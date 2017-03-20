rm (list = ls())
# setwd() to the dir where the script have been stored
if (!require("rstudioapi"))
  install.packages("rstudioapi")
library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
# Loading the functions
source("sourceAll.R")

replicationCount = 50
size = 100
psi = .5
sigma = 1
mean = 0
# for iid
gamma0 = sigma ^ 2
rho = rep(0, length = size)
# for MA1
gamma0 = sigma ^ 2 * (1 + psi ^ 2)
rho = rep(0, length = size)
rho [1] = psi / (1 + psi ^ 2)

lagCount = 10
lagCount = min(lagCount, size)


# original <- createOriginalMA1(size = size, 
#                               psi = psi, 
#                               sigma = sigma)
originalReplicated <- createOriginalMA1Replicated(replicationCount = replicationCount,
                                                   size = size, 
                                                   psi = psi, 
                                                   sigma = sigma)
original = originalReplicated [1, ]

# create scalar lrvOriginal out of originalReplicated
lrvOriginal <- createLRVof2dArray(array2d = originalReplicated)

exportOriginal(original)
exportOriginal(originalReplicated)

cMatrix <- createCMatrix(size = size,
                         psi = psi,
                         sigma = sigma)

dMatrix <- createDMatrix(size = size,
                         psi = psi,
                         sigma = sigma)

productCol <- createProductCol(original = original)
dim(productCol)
productColReplicated <- createProductColReplicated(originalReplicated = originalReplicated,
                                                   size = size,
                                                   replicationCount = replicationCount)
productColReplicated

saveProductCol(dataframe = productCol)
saveProductCol(dataframe = as.data.frame(productColReplicated))
drawProductCol(productCol = productCol,
               size = size,
               mean = mean,
               sigma = sigma,
               lagCount = lagCount,
               darkestColor = "dark green",
               lightestColor = "white")


lrvProductColReplicated <- createLRVof3dArray(array3d = productColReplicated)
 

betaArray <- createBetaArray(original = original, rho = rho)

betaArrayReplicated <- createBetaArrayReplicated(originalReplicated = originalReplicated,
                                                 size = size,
                                                 replicationCount = replicationCount)

lrvBetaArray <- createLRVof3dArray(array3d = betaArrayReplicated)


cHatMatrix <- createCHatMatrix(productCol, size)
dHatMatrix <- createDHatMatrix(betaArray, size)
dim(cHatMatrix)

createDiffCMatrix_vs_CHatMatrix(cMatrix = cMatrix, 
                                cHatMatrix = cHatMatrix,
                                lagCount = 100)
createDiffDMatrix_vs_DHatMatrix(dMatrix = dMatrix, 
                                dHatMatrix = dHatMatrix,
                                lagCount = 100)

drawCvsCHat(cMatrix = cMatrix, cHatMatrix = cHatMatrix)
drawDvsDHat(dMatrix = dMatrix, dHatMatrix = dHatMatrix)
