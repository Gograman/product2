createProductColReplicatedFunction <- function() {
  cat("\nTesting \'tests_12_createProductColReplicated\' \n")
  myReplicationCount = 10
  mySize = 10
  mySigma <- 1
  myPsi <- 0.5
  Start <- Sys.time()

  originalMA1Replicated <- createOriginalMA1Replicated(replicationCount = myReplicationCount,
                                                       size = mySize,
                                                       psi = myPsi,
                                                       sigma = mySigma)
  productColReplicated <- createProductColReplicated(originalMA1Replicated)

  End <- Sys.time()
  duration <- End - Start
  expect_that(dim(productColReplicated), equals(c(mySize, mySize, myReplicationCount)))
  cat(" - dimensions of productColReplicated are all right. \n")
  cat("Duration =", duration, "\n")
  cat("productColReplicated =", unlist(productColReplicated[1:3, 1:3, 1:3]), "\n")
  cat("Test parameters:", "\n")
  cat("replicationCount =", myReplicationCount, "\n")
  cat("size =", mySize, "\n")
  cat("psi =", myPsi, "\n")
  cat("sigma =", mySigma, "\n")
}


test_that(desc = "Testing createProductColReplicated",
          code = {
            createProductColReplicatedFunction()
            cat("End of test createProductColReplicated","\n")
            cat("=====================")
})
