createDMatrix <- function(size,
                          sigma,
                          psi) {
  dMatrix <-  array(0, dim = c(size - 1, size - 1))
  d01 = (1 + psi ^ 4 + 3 * psi ^ 2) / ((psi ^ 2 + 1) ^ 2)
  d02 <- sigma ^ 4 * ((1 + psi ^ 2) ^ 2)
  d11 <-  psi ^ 2 * (psi ^ 2 - 1) / ((1 + psi ^ 2) ^ 4)
  d12 <- psi ^ 2 * sigma ^ 4
  
  
  # Dmatrix[1, 3], Dmatrix[2, 3] values to d02, d12
  # dMatrix[1, 2], dMatrix[2, 2], a.k.a. d_01, d_11
  
  dMatrix[1, 2] <- d01
  dMatrix[2, 2] <- d11
  dMatrix[1, 3] <- d02
  dMatrix[2, 3] <- d12
  
  dMatrix <- dMatrix / (sigma ^ 4 * ((1 + psi ^ 2) ^ 2))
  dMatrix [, 4:dim(dMatrix)[2]] = dMatrix [, 3]
  dMatrix
}


