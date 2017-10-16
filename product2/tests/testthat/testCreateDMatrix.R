# Testing createDMatrix function
# for dimensions of result - dMatrix

testDimsOfDMatrix = function() {
  myDMatrix = createDMatrix(size = 10,
                            sigma = 1,
                            psi = 0.5)
  dimOfDMatrix <- dim(myDMatrix)
  dimShouldBe <- c(9, 9)
  expect_that(dimOfDMatrix, equals(dimShouldBe))
}

test_that(desc = "Testing createDMatrix for dimensions", 
          code = testDimsOfDMatrix())

# Testing dMatrix for zeros in the first column
testFirstColOfZeros <- function() {
  myDMatrix <- createDMatrix(size = 10,
                             sigma = 1,
                             psi = 0.5)
  firstColOfDMatrix <- myDMatrix[, 1]
  aShouldBeArray <- rep(0, 9)
  expect_that(firstColOfDMatrix, equals(aShouldBeArray))
}

test_that(desc = "Testing dMatrix for zero columns", 
          code = testFirstColOfZeros())


  

