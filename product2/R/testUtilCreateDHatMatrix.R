#' export

testUtilCreateDHatMatrix <- function(size,
                                     psi,
                                     sigma) {
  cat("\nTesting \'tests_32_createDHatMatrix\' \n")
  Start <- Sys.time()
  original <- createOriginalMA1(size = size,
                                psi = psi,
                                sigma = sigma)
  rho <- createRho(size = size,
                   psi = psi)
  betaArray <- createBetaArray(original = original,
                               psi = psi,
                               sigma = sigma)
  dHatMatrix <- createDHatMatrix(betaArray = betaArray,
                                 size = 10)
  End <- Sys.time()
  duration <- End - Start
  # dimOfCHatMatrix <- dim(dHatMatrix)
  # dimShouldBe <- rep(x = size - 1, times = 2)
  # expect_that(dimOfCHatMatrix, equals(dimShouldBe))
  # cat(" - dimensions of cHatMatrix are correct. \n")
  cat("Duration =", duration, "\n")
  cat("dHatMatrix =", as.vector(unlist(dHatMatrix[1:3, 1:3])), "\n")
  cat("Test parameters:", "\n")
  cat("betaArray =", as.vector(unlist(betaArray[1:3, 1:3])), "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("End of test createDHatMatrix","\n")
  cat("=====================")
}
