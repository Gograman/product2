#' @export

testUtilCreateOriginalMA1 <- function() {
  originalMA1 <- createOriginalMA1(replicationCount = 10,
                                                       size = 10,
                                                       psi = 0.5,
                                                       sigma = 1)
}
