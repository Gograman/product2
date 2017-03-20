test_that("Testing dMatrix for dimensions", {
  expect_that(dim(createDMatrix(size = 10,
                                sigma = 1,
                                psi = 0.5)), equals(c(9, 9)))
  
})

test_that("Testing dMatrix for zero columns", {
  expect_that(createDMatrix(size = 10,
                                sigma = 1,
                                psi = 0.5)[ , 1], 
              equals(rep(0, 9)))
  
})
