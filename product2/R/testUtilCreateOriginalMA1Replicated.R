#' @export

testUtilCreateOriginalMA1Replicated <- function(replicationCount,
                                                size,
                                                psi,
                                                sigma) {
  cat("\nTesting \'tests_05_createOriginalMA1Replicated\' \n")
  Start <- Sys.time()
  originalMA1Replicated <- createOriginalMA1Replicated(replicationCount = replicationCount,
                                                       size = size,
                                                       psi = psi,
                                                       sigma = sigma)
  End <- Sys.time()
  duration <- End - Start
  expect_that(dim(originalMA1Replicated), equals(c(replicationCount, size)))
  cat(" - dimensions of originalMA1Replicated array are all right. \n")
  cat("Duration =", duration, "\n")
  cat("OriginalMa1Replicated =", originalMA1Replicated[1:5, 1:5], "\n")
  cat("Test parameters:", "\n")
  cat("replicationCount =", replicationCount, "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("End of test createOriginalMA1Replicated","\n")
  cat("=====================")

}
