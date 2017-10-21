if (!require("rstudioapi"))
  install.packages("rstudioapi")
library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

size = 10
replicationCount = getReplicationCountFromSampleSize(size)
psi = 0.5
# psi = 0 # makes it iid
sigma = 1
mean = 0
gamma0 = sigma ^ 2 * (1 + psi ^ 2)
rho = rep(0, length = size-1)
rho [1] = psi / (1 + psi ^ 2)
dMatrix <- createDMatrix(size = size,
                         psi = psi,
                         sigma = sigma)
lrvBetaArrayReplicated = dMatrix [1,] + 2 * dMatrix [2,]

originalReplicated <- createOriginalMA1Replicated(replicationCount = replicationCount,
                                                  size = size,
                                                  psi = psi,
                                                  sigma = sigma)
betaArrayReplicated <- createBetaArrayReplicated(originalReplicated = originalReplicated,
                                                 size = size,
                                                 replicationCount = replicationCount,
                                                 rho = rho)
