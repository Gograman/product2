#' @title createBetaArrayReplicated
#'
#' @name
#'
#' @aliases
#'
#' @description
#'
#' @param originalReplicated originalReplicated
#' @param size size
#' @param replicationCount replicationCount
#' @param rho rho
#'
#' @return
#'
#' @examples
#'
#' @export



createBetaArrayReplicated <- function(originalReplicated,
                                      size,
                                      replicationCount,
                                      rho) {
  betaArrayReplicated  <- array(NA, dim = c(size-1, size, replicationCount))
  for (i in 1:replicationCount) {
    betaArrayReplicated[ , , i] <- createBetaArray(original = originalReplicated[i, ],
                                                   rho = rho)
  }

  betaArrayReplicated
}
