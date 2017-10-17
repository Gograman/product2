# Testing createCMatrix function
# for dimensions of result

myTestFunction = function() {
  cat("\n Testing \'tests_01_createCMatrix\' \n")
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
  cat("\nDuration = ",duration,"\n")
  cat("\nCmatrix = ",myCMatrix,"n")
  cat("=====================")
  cat("\nTest parameters :","\n")
  cat("\nsize = ",mySize,"\n")
  cat("\npsi = ",myPsi,"\n")
  cat("\nsigma = ",mySigma,"\n")
}

test_that(desc = "Testing createCMatrix for dimensions",
          code = {
            myTestFunction()
            cat(" End of test createCMatrix","\n")
            cat("=====================")
            })
