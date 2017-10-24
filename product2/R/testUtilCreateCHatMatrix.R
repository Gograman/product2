#' export

testUtilCreateCHatMatrix <- function(size,
                                     psi,
                                     sigma) {
  cat("\nTesting \'tests_31_createCHatMatrix\' \n")
  Start <- Sys.time()
  original <- createOriginalMA1(size = size,
                                psi = psi,
                                sigma = sigma)
  productCol <- createProductCol(original)
  cHatMatrix <- createCHatMatrix(productCol)
  End <- Sys.time()
  duration <- End - Start
  # dimOfCHatMatrix <- dim(cHatMatrix)
  # dimShouldBe <- rep(x = size - 1, times = 2)
  # expect_that(dimOfCHatMatrix, equals(dimShouldBe))
  # cat(" - dimensions of cHatMatrix are correct. \n")
  cat("Duration =", duration, "\n")
  cat("cHatMatrix =", as.vector(unlist(cHatMatrix[1:3, 1:3])), "\n")
  cat("Test parameters:", "\n")
  cat("productCol =", as.vector(unlist(productCol[1:3, 1:3])), "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("End of test createCHatMatrix","\n")
  cat("=====================")
}
