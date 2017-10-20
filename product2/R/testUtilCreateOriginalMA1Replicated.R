#' @export

testUtilCreateOriginalMA1Replicated <- function() {
  originalMA1Replicated <- createOriginalMA1Replicated(replicationCount = 10,
                                                       size = 10,
                                                       psi = 0.5,
                                                       sigma = 1)
}
