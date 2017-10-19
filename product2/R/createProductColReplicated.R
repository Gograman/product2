#' @title createProductColReplicated
#'
#' @name createProductColReplicated
#'
#' @aliases createProductColReplicated
#'
#' @description Creating a three-dimensional array of dimensions \code{c(size, size, replicationCount)} using \code{createProductCol()} as an underlying function.
#'
#' @param originalReplicated A two-dimensional array.
#' @param size The size of the one-dimensional array.
#' @param replicationCount A number of replications, other words, an amount of times \code{createProductCol()} is going to be executed over \code{originalReplicated} .
#'
#' @return Returning a three-dimensional array of dimensions \code{c(size, size, replicationCount)}
#'
#' @examples
#' originalReplicated <- createOriginalMA1Replicated (replicationCount = 10, size = 10, psi = 0.5, sigma = 1)
#' createProductColReplicated(originalReplicated, size = 10, replicationCount = 10)
#'
#' @export

createProductColReplicated <- function(originalReplicated, size, replicationCount) {

  prodColReplicated <- apply(X = originalReplicated,
                             MARGIN = 1,
                             FUN = createProductCol)
  prodColReplicated <- array(as.numeric(unlist(prodColReplicated)),
                             dim=c(size, size, replicationCount))
}
