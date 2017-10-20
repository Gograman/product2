# Testing createCMatrix function
# for dimensions of result

myTestFunction = function() {
  cat("\nTesting \'tests_01_createCMatrix\' \n")
  mySize <- 10
  mySigma <- 1
  myPsi <- 0.5
  Start <- Sys.time()
  myCMatrix = createCMatrix(size = mySize,
                            sigma = mySigma,
                            psi = myPsi)
  End <- Sys.time()
  duration <- End - Start
  dimOfCMatrix <- dim(myCMatrix)
  dimShouldBe <- c(9, 9)
  expect_that(dimOfCMatrix, equals(dimShouldBe))
  cat(" - dimensions of cMatrix are correct. \n")
  cat("Duration =", duration, "\n")
  cat("cmatrix =", myCMatrix[1:5, 1:5], "\n")
  cat("Test parameters:", "\n")
  cat("size =", mySize, "\n")
  cat("psi =", myPsi, "\n")
  cat("sigma =", mySigma, "\n")
}

test_that(desc = "Testing createCMatrix for dimensions",
          code = {
            myTestFunction()
            cat("End of test createCMatrix","\n")
            cat("=====================")
            })
