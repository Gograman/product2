#' @title createOriginalMA1Replicated
#'
#' @name createOriginalMA1Replicated
#'
#' @aliases createOriginalMA1Replicated
#'
#' @description createOriginalMA1Replicated
#'
#' @param replicationCount replicationCount 
#' @param size size
#' @param psi psi
#' @param sigma sigma
#'
#' @return originalMA1Replicated
#'
#' @examples
#'
#' @export

createOriginalMA1Replicated <- function(replicationCount = 10,
                                        size = 10,
                                        psi = 0.5,
                                        sigma = 1) {

  originalMA1Replicated <- array(NA, dim = c(replicationCount, size))

  for (i in 1:replicationCount) {
    originalMA1Replicated[i, ] <- createOriginalMA1(size, psi, sigma)
  }

  originalMA1Replicated
}
