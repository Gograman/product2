#' export

testUtilCreateBetaArray <- function(size,
                                    psi,
                                    sigma) {
  cat("\nTesting \'tests_21_createBetaArray\' \n")

  Start <- Sys.time()


  gamma <- createGamma(sigma = sigma,
                       psi = psi)
  original <- createOriginalMA1(size = size,
                                psi = psi,
                                sigma = sigma)

  betaArray <- createBetaArray(original, gamma0 = gamma[1])

  End <- Sys.time()
  duration <- End - Start
  dimOfBetaArray <- dim(betaArray)
  dimShouldBe <- c(9, 10)
  expect_that(dimOfBetaArray, equals(dimShouldBe))
  cat(" - dimensions of betaArray are correct. \n")
  cat("Duration =", duration, "\n")
  cat("dimOfBetaArray =", betaArray[1:3, 1:3], "\n")
  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("original =", original[1:5], "\n")
  cat("rho =", rho, "\n")
  cat("gamma0 =", gamma0, "\n")
  cat("End of test createBetaArray","\n")
  cat("=====================")
}
