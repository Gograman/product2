createOriginalMA1ReplicatedFunction <- function() {
  cat("\nTesting \'tests_05_createOriginalMA1Replicated\' \n")
  myReplicationCount <- 10
  mySize <- 10
  mySigma <- 1
  myPsi <- 0.5
  Start <- Sys.time()
  myOriginalMa1Replicated <- createOriginalMA1Replicated(replicationCount = myReplicationCount,
                                                         size = mySize,
                                                         psi = myPsi,
                                                         sigma = mySigma)
  End <- Sys.time()
  duration <- End - Start
  expect_that(dim(myOriginalMa1Replicated), equals(c(myReplicationCount, mySize)))
  cat(" - dimensions of myOriginalMa1Replicated array are all right. \n")
  cat("Duration =", duration, "\n")
  cat("OriginalMa1Replicated =", myOriginalMa1Replicated[1:5, 1:5], "\n")
  cat("Test parameters:", "\n")
  cat("replicationCount =", myReplicationCount, "\n")
  cat("size =", mySize, "\n")
  cat("psi =", myPsi, "\n")
  cat("sigma =", mySigma, "\n")
}


test_that(desc = "Testing createOriginal for length",
          code = {
            createOriginalMA1ReplicatedFunction()
            cat("End of test createOriginal","\n")
            cat("=====================")
})
