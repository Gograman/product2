createOriginalMA1Funtion<-function()
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
  cat("\nDuration = ",duration,"\n")
  cat("\nOriginalMa1 = ",myOriginalMa1,"\n")
  cat("=====================")
  cat("\nTest parameters :","\n")
  cat("\nsize = ",mySize,"\n")
  cat("\npsi = ",myPsi,"\n")
  cat("\nsigma = ",mySigma,"\n")
}


test_that("Testing createOriginal for length", {
  createOriginalMA1Funtion()
  cat(" End of test createOriginal","\n")
  cat("=====================")
})
