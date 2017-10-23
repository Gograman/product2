#' @export

testUtilCreateProductColReplicated <- function(replicationCount,
                                               size,
                                               psi,
                                               sigma) {
  cat("\nTesting \'tests_12_createProductColReplicated\' \n")
  Start <- Sys.time()

  originalMA1Replicated <- createOriginalMA1Replicated(replicationCount = replicationCount,
                                                       size = size,
                                                       psi = psi,
                                                       sigma = sigma)
  productColReplicated <- createProductColReplicated(originalMA1Replicated)

  End <- Sys.time()
  duration <- End - Start
  expect_that(dim(productColReplicated), equals(c(size, size, replicationCount)))
  cat(" - dimensions of productColReplicated are all right. \n")
  cat("Duration =", duration, "\n")
  cat("productColReplicated =", unlist(productColReplicated[1:3, 1:3, 1:3]), "\n")
  cat("Test parameters:", "\n")
  cat("replicationCount =", replicationCount, "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("End of test createProductColReplicated","\n")
  cat("=====================")

}
