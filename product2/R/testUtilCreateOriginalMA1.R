#' @export

testUtilCreateOriginalMA1 <- function(replicationCount,
                                      size,
                                      psi,
                                      sigma) {
  cat("\nTesting \'tests_04_createOriginalMA1\' \n")
  Start <- Sys.time()
  originalMA1 <- createOriginalMA1(replicationCount = replicationCount,
                                   size = size,
                                   psi = psi,
                                   sigma = sigma)
  End <- Sys.time()
  duration <- End - Start
  expect_that(length(myOriginalMa1), equals(10))
  cat(" - length of originalMa1 array is all right. \n")
  cat("Duration =", duration, "\n")
  cat("OriginalMa1 =", myOriginalMa1[1:5], "\n")
  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("End of test createOriginalMA1","\n")
  cat("=====================")

}
