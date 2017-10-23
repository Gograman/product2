#' @export

testUtilCreateProductCol <- function(replicationCount,
                                     size,
                                     psi,
                                     sigma) {
  cat("\nTesting \'tests_11_createProductCol\' \n")
  Start <- Sys.time()

  originalMA1 <- createOriginalMA1(replicationCount = replicationCount,
                                   size = size,
                                   psi = psi,
                                   sigma = sigma)
  productCol <- createProductCol(originalMA1)

  End <- Sys.time()
  duration <- End - Start
  expect_that(dim(productCol), equals(c(size, size)))
  cat(" - dimensions of productCol are all right. \n")
  cat("Duration =", duration, "\n")
  cat("productCol =", unlist(productCol[1:5, 1:5]), "\n")
  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("End of test createProductCol","\n")
  cat("=====================")
}
