# Testing dMatrix for zeros in the first column
firstColOfZerosFunction <- function() {
  cat("\nTesting \'tests_03_FirstColOfZeros\' \n")
  mySize <- 10
  mySigma <- 1
  myPsi <- 0.5
  Start <- Sys.time()
  myDMatrix <- createDMatrix(size = mySize,
                             sigma = mySigma,
                             psi = myPsi)
  End <- Sys.time()
  duration <- End - Start
  firstColOfDMatrix <- myDMatrix[, 1]
  aShouldBeArray <- rep(0, 9)
  expect_that(firstColOfDMatrix, equals(aShouldBeArray))
  cat(" - ColOfZeros array is all right. \n")

  cat("Duration = ",duration,"\n")
  cat("first colum of Dmatrix = ",firstColOfDMatrix,"\n")
  cat("Test parameters :","\n")
  cat("size = ",mySize,"\n")
  cat("psi = ",myPsi,"\n")
  cat("sigma = ",mySigma,"\n")
}

test_that(desc = "Testing dMatrix for zeros in the first column",
          code = {
            firstColOfZerosFunction()
            cat(" End of test firstColOfZeros","\n")
            cat("=====================")
          })

