rm (list = ls())
# setwd() to the dir where the script have been stored
if (!require("rstudioapi"))
  install.packages("rstudioapi")
library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
# Loading the functions
source("sourceAll.R")

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

# Loading functions
source("sourceAll.R")

original <- createOriginalMA1(size = size, 
                              psi = psi, 
                              sigma = sigma)
exportOriginal(original)

cMatrix <- createCMatrix(size = size, 
                         psi = psi, 
                         sigma = sigma)

dMatrix <- createDMatrix(size = size, 
                         psi = psi, 
                         sigma = sigma)

productCol <- createProductCol(original = original)

saveProductCol(productCol)

drawProductCol(productCol = productCol,
               size = size,
               mean = mean,
               sigma = sigma,
               lagCount = lagCount,
               darkestColor = "dark green",
               lightestColor = "white")



# 
# drawAcf(acfDF, lagCount)

# pacfDF <- createPacf(productCol = productCol)
# 
# drawPacf(pacfDF, lagCount)

betaArray <- createBetaArray(original, rho)

acfProdCol <- createAcf(x = productCol)
acfbetaArray <- createAcf(x = betaArray)

# cHatMatrix <- createCHatMatrix(productCol, size)

cHatMatrix <- createCHatMatrix(productCol, size)

dHatMatrix <- createDHatMatrix(betaArray, size)



unlist(acfbetaArray[1, 2])[1:10]
dHatMatrix[, 1][1:10]

unlist(acfProdCol[1, 2])[1:10]
cHatMatrix[, 2][1:10]
# 
# 
createDiffCMatrix_vs_CHatMatrix(cMatrix = cMatrix, cHatMatrix = cHatMatrix)
createDiffDMatrix_vs_DHatMatrix(dMatrix = dMatrix, dHatMatrix = dHatMatrix)
drawCvsCHat(cMatrix = cMatrix, cHatMatrix = cHatMatrix)
drawDvsDHat(dMatrix = dMatrix, dHatMatrix = dHatMatrix)

# acf (original)
# acf (productCol [, 1])
# 
# original[1:5]
# cMatrix[1:5, 1:5]
# dMatrix[1:5, 1:5]
# productCol[1:5, 1:5]
# acfDF[1, 1:5] # huge
# pacfDF[1, 1:5] # huge
# betaArray[1:5, 1:5]
# cHatMatrix[1:5, 1:5]
# dHatMatrix[1:5, 1:5]
# 
# # to be done
# # graphics, namely
# # create diff of C and CHat
# # create diff of D and DHat
# # graphics output
# 
# 
dMatrix [1:10, 1]
dHatMatrix [1:10, 1]
dMatrix [2, 2]
dHatMatrix [2, 2]


