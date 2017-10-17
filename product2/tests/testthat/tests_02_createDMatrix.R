# Testing createDMatrix function
# for dimensions of result - dMatrix

createDMatrixFuntion = function() {
  cat("\n Testing \'tests_02_createDMatrix\' \n")
  mySize <- 10
  mySigma <- 1
  myPsi <- 0.5
  Start <- Sys.time()
  myDMatrix <- createDMatrix(size = mySize,
                             sigma = mySigma,
                             psi = myPsi)
  End <- Sys.time()
  duration <- End - Start
  dimOfDMatrix <- dim(myDMatrix)
  dimShouldBe <- c(9, 9)
  expect_that(dimOfDMatrix, equals(dimShouldBe))
  cat("\nDuration = ",duration,"\n")
  cat("\nDmatrix = ",myDMatrix,"n")
  cat("=====================")
  cat("\nTest parameters :","\n")
  cat("\nsize = ",mySize,"\n")
  cat("\npsi = ",myPsi,"\n")
  cat("\nsigma = ",mySigma,"\n")
}

test_that(desc = "Testing createDMatrix for dimensions",
          code = {
            createDMatrixFuntion()
            cat(" End of test createDMatrix","\n")
            cat("=====================")
          })

