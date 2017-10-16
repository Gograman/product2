test_that("Testing createOriginal for length", {
  expect_that(length(createOriginalMA1(size = 10,
                                       psi = 0.5,
                                       sigma = 1)), equals(10))
})
