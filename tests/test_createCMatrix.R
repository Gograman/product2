test_that("Testing createCMatrix for dimensions", {
  expect_that(dim(createCMatrix(size = 10,
                                sigma = 1,
                                psi = 0.5)), equals(c(9, 9)))
})
