testUtilCreateLRVof3dArray <- function(replicationCount, size,
                                       psi,
                                       sigma) {
  cat("\nTesting \'tests_31_CreateLRVof3dArray\' \n")

  Start <- Sys.time()
  originalReplicated <-
    createOriginalMA1Replicated (
      replicationCount = replicationCount,
      size = size,
      psi = psi,
      sigma = sigma
    )
  productColReplicated <-
    createProductColReplicated(originalReplicated)
  LRV3dArray = createLRVof3dArray(productColReplicated)
  End <- Sys.time()
  duration <- End - Start
  cat("Duration =", duration, "\n")
  cat("LRV3dArray =",LRV3dArray, "\n")
  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("replicationCount =", replicationCount, "\n")
  cat("originalREplicated =", originalReplicated[1:5], "\n")
  cat("End of test CreateLRVof3dArray", "\n")
  cat("=====================")
}
