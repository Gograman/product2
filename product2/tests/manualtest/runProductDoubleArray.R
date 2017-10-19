# setwd() to the dir where the script have been stored
if (!require("rstudioapi"))
  install.packages("rstudioapi")
library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
# Loading the functions
# source("sourceAll.R") # legacy, before it was a package

replicationCount = 3
size = 100
psi = .5
# psi = 0 # makes it iid
sigma = 1
mean = 0
# for iid
# gamma0 = sigma ^ 2
# rho = rep(0, length = size)
# for MA1
gamma0 = sigma ^ 2 * (1 + psi ^ 2)
rho = rep(0, length = size)
rho [1] = psi / (1 + psi ^ 2)
gamma1 = psi * sigma^2
lrvOriginal = gamma0 + 2 * gamma1

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
lrvOriginalHat <- createLRVof2dArray(array2d = originalReplicated)
lrvOriginalHat
lrvOriginal

exportOriginal(original)
exportOriginal(originalReplicated)

cMatrix <- createCMatrix(size = size,
                         psi = psi,
                         sigma = sigma)

lrvProductColReplicated = cMatrix [1,] + 2 * cMatrix [2,]
lrvProductColReplicated


dMatrix <- createDMatrix(size = size,
                         psi = psi,
                         sigma = sigma)
lrvBetaArrayReplicated = dMatrix [1,] + 2 * dMatrix [2,]
lrvBetaArrayReplicated

productCol <- createProductCol(original = original)
dim(productCol)
productColReplicated <- createProductColReplicated(originalReplicated = originalReplicated,
                                                   size = size,
                                                   replicationCount = replicationCount)
productColReplicated

# saveProductCol(dataframe = productCol)
# saveProductCol(dataframe = as.data.frame(productColReplicated))
drawProductCol(productCol = productCol,
               size = size,
               mean = mean,
               sigma = sigma,
               lagCount = lagCount,
               darkestColor = "dark green",
               lightestColor = "white")

# the last NA needs to be investigated
# var is applicable when the length is 2 and more
# may be need to cut the last one
lrvProductColReplicatedHat <- createLRVof3dArray(array3d = productColReplicated)
lrvProductColReplicatedHat
lrvProductColReplicated
# compare

maxLRV = max (c(lrvProductColReplicated, lrvProductColReplicatedHat), na.rm = T)
minLRV = min (lrvProductColReplicated, lrvProductColReplicatedHat)
jpeg("./plots/alpha_lrv.jpeg")
plot (lrvProductColReplicated, pch = 17, col = "green",
      ylim = c(minLRV - 1, maxLRV + 1))
points (lrvProductColReplicatedHat, pch = 17, col = "red")
graphics.off()

betaArray <- createBetaArray(original = original, rho = rho)

betaArrayReplicated <- createBetaArrayReplicated(originalReplicated = originalReplicated,
                                                 size = size,
                                                 replicationCount = replicationCount,
                                                 rho = rho)

lrvBetaArrayReplicatedHat <- createLRVof3dArray(array3d = betaArrayReplicated)
lrvBetaArrayReplicatedHat
lrvBetaArrayReplicated



cHatMatrix <- createCHatMatrix(productCol, size)
dHatMatrix <- createDHatMatrix(betaArray, size)
dim(cHatMatrix)

createDiffCMatrixVsCHatMatrix(cMatrix = cMatrix,
                                cHatMatrix = cHatMatrix)
createDiffDMatrixVsDHatMatrix(dMatrix = dMatrix,
                                dHatMatrix = dHatMatrix)

drawCvsCHat(cMatrix = cMatrix, cHatMatrix = cHatMatrix)
drawDvsDHat(dMatrix = dMatrix, dHatMatrix = dHatMatrix)

drawProductCol(productCol = productCol,
               size = size,
               mean = mean,
               sigma = sigma,
               lagCount = lagCount
               )

