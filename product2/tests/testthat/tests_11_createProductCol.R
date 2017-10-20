createProductColFunction <- function() {
  cat("\nTesting \'tests_11_createProductCol\' \n")
  mySize = 10
  mySigma <- 1
  myPsi <- 0.5
  Start <- Sys.time()

  originalMA1 <- createOriginalMA1(size = mySize,
                                   psi = myPsi,
                                   sigma = mySigma)
  productCol <- createProductCol(originalMA1)
  End <- Sys.time()
  duration <- End - Start
  expect_that(dim(productCol), equals(c(mySize, mySize)))
  cat(" - dimensions of productCol are all right. \n")
  cat("Duration =", duration, "\n")
  cat("productCol =", unlist(productCol[1:5, 1:5]), "\n")
  cat("Test parameters:", "\n")
  cat("size =", mySize, "\n")
  cat("psi =", myPsi, "\n")
  cat("sigma =", mySigma, "\n")
}


test_that(desc = "Testing createProductCol",
          code = {
            createProductColFunction()
            cat("End of test createProductCol","\n")
            cat("=====================")
})
