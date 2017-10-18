#' @title createOriginalMA1Replicated
#'
#' @name createOriginalMA1Replicated
#'
#' @aliases createOriginalMA1Replicated
#'
#' @description Creating a two-dimensional array using \code{createOriginalMA1()}, as an underlyin function, passing \code{replicationCount} as the outer counter, \code{size}, \code{sigma} and \code{psi} (\code{psi} being the argument of the model).
#'
#' @param replicationCount replicationCount 
#' @param size size
#' @param psi psi
#' @param sigma sigma
#'
#' @return  Returninng a two-dimensional array of dimensions \code{c(replicationCount, size)}.
#'
#' @examples
#' createOriginalMA1Replicated (replicationCount = 10, size = 10, psi = 0.5, sigma = 1)
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
