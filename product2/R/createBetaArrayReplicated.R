#' @title createBetaArrayReplicated
#'
#' @name createBetaArrayReplicated
#'
#' @aliases createBetaArrayReplicated
#'
#' @description Creating a three-dimensional array of dimensions \code{c(size - 1, size, replicationCount)} using \code{createBetaArray()} as an underlying function.
#'
#' @param originalReplicated originalReplicated
#' @param size size
#' @param replicationCount replicationCount
#' @param rho rho
#'
#' @return Returning a three-dimensional array of dimensions \code{c(size - 1, size, replicationCount)}
#'
#' @examples
#' originalReplicated <- createOriginalMA1Replicated(replicationCount = 10, size = 10, psi = 0.5, sigma = 1)
#' createBetaArrayReplicated(originalReplicated, size = 10, replicationCount = 10, rho = 0.5)
#'
#' @export



createBetaArrayReplicated <- function(originalReplicated,
                                      size,
                                      replicationCount,
                                      rho) {
  betaArrayReplicated  <- array(NA, dim = c(size - 1, size, replicationCount))
  for (i in 1:replicationCount) {
    betaArrayReplicated[ , , i] <- createBetaArray(original = originalReplicated[i, ],
                                                   rho = rho)
  }

  betaArrayReplicated
}
