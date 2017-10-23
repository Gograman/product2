#' @title createBetaArrayReplicated
#'
#' @name createBetaArrayReplicated
#'
#' @aliases createBetaArrayReplicated
#'
#' @description Creating a three-dimensional array of dimensions \code{c(size - 1, size, replicationCount)} using \code{createBetaArray()} as an underlying function.
#'
#' @param originalReplicated A three-dimensional array of dimensions \code{c(replicationCount, size)}.
#' @param size The size of the one-dimensional array \code{original}.
#' @param replicationCount An number of replications, other words amount of times \code{createBetaArray()} is going to be executed.
#' @param rho A \code{rho} parameter.
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
