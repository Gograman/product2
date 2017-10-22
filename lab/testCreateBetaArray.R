if (!require("rstudioapi"))
  install.packages("rstudioapi")
library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

size = 10

psi = 0.5
# psi = 0 # makes it iid
sigma = 1
mean = 0

rho = rep(0, length = size-1)
rho [1] = psi / (1 + psi ^ 2)
gamma0 = sigma ^ 2 * (1 + psi ^ 2)


myOriginal <- createOriginalMA1(size = size,
                                psi = psi,
                                sigma = sigma)

myBetaArray <- createBetaArray(original = myOriginal,
                               rho = rho,
                               gamma0 = gamma0)


