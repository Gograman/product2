createOriginalMA1Function<-function()
{
  cat("\nTesting \'tests_04_createOriginalMA1\' \n")
  mySize <- 10
  mySigma <- 1
  myPsi <- 0.5
  Start <- Sys.time()
  myOriginalMa1 <- createOriginalMA1(size = mySize,
                                     psi = myPsi,
                                     sigma = mySigma)
  End <- Sys.time()
  duration <- End - Start
  expect_that(length(myOriginalMa1), equals(10))
  cat(" - length of originalMa1 array is all right. \n")
  cat("Duration =", duration, "\n")
  cat("OriginalMa1 =", myOriginalMa1[1:5], "\n")
  cat("Test parameters:", "\n")
  cat("size =", mySize, "\n")
  cat("psi =", myPsi, "\n")
  cat("sigma =", mySigma, "\n")
}


test_that(desc = "Testing createOriginal for length",
		  code = {
		  createOriginalMA1Function()
		  cat("End of test createOriginalMA1", "\n")
		  cat("=====================")
})
