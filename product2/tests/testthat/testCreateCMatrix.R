# Testing createCMatrix function
# for dimensions of result

myTestFunction = function() {
  myCMatrix = createCMatrix(size = 10,
                            sigma = 1,
                            psi = 0.5)
  dimOfCMatrix <- dim(myCMatrix)
  dimShouldBe <- c(9, 9)
  expect_that(dimOfCMatrix, equals(dimShouldBe))
}

test_that(desc = "Testing createCMatrix for dimensions", 
          code = myTestFunction())
