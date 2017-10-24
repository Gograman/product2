# Testing createCHatMatrix function
# for dimensions of result

test_that(desc = "Testing createDHatMatrix for dimensions",
          code = {
            testUtilCreateDHatMatrix(size = 10,
                                     psi = 0.5,
                                     sigma = 1)
            })
