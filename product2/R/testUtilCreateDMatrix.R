#' export

testUtilCreateDMatrix <- function(size,
                                  sigma,
                                  psi) {
  cat("\nTesting \'tests_02_createDMatrix\' \n")
  Start <- Sys.time()
  dMatrix <- createDMatrix(size = size,
                           sigma = sigma,
                           psi = psi)
  End <- Sys.time()
  duration <- End - Start
  dimOfDMatrix <- dim(dMatrix)
  dimShouldBe <- c(9, 9)
  expect_that(dimOfDMatrix, equals(dimShouldBe))
  cat(" - dimensions of dMatrix are correct. \n")
  cat("Duration =", duration, "\n")
  cat("dMatrix =", dMatrix[1:5, 1:5], "\n")
  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("End of test createDMatrix","\n")
  cat("=====================")
}
