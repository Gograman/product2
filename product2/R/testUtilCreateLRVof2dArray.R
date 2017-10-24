testUtilCreateLRVof2dArray <- function(size,
                                    psi,
                                    sigma) {
  cat("\nTesting \'tests_30_CreateLRVof2dArray\' \n")

  Start <- Sys.time()
  original <- createOriginalMA1(size = size, psi = psi, sigma = sigma)
  productCol <- createProductCol(original)
 LVR2dArray=createLRVof2dArray(productCol)
  End <- Sys.time()
  duration <- End - Start
  cat("Duration =", duration, "\n")
  cat("LRV2dArray =",as.vector(unlist(LVR2dArray)), "\n")
  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("original =", original[1:5], "\n")
  cat("End of test CreateLRVof2dArray","\n")
  cat("=====================")
}
