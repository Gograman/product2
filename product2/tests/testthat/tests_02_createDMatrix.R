# Testing createDMatrix function
# for dimensions of result - dMatrix

createDMatrixFunction = function() {
  cat("\nTesting \'tests_02_createDMatrix\' \n")
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
  cat(" - dimensions of dMatrix are correct. \n")
  cat("Duration = ",duration,"\n")
  cat("Dmatrix = ",myDMatrix[1:5, 1:5],"\n")
  cat("Test parameters :","\n")
  cat("size = ",mySize,"\n")
  cat("psi = ",myPsi,"\n")
  cat("sigma = ",mySigma,"\n")
}

test_that(desc = "Testing createDMatrix for dimensions",
          code = {
            createDMatrixFunction()
            cat("End of test createDMatrix","\n")
            cat("=====================")
          })

