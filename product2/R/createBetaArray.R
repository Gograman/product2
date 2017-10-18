#' @title createBetaArray
#'
#' @name createBetaArray
#'
#' @aliases createBetaArray
#'
#' @description Creating a two-dimensional array of dimensions \code{c(size - 1, size)}.
#'
#' @param original original
#' @param rho rho
#'
#' @return Returning a two-dimensional array of dimensions \code{c(size - 1, size)}.
#'
#' @examples
#' original <- createOriginalMA1(size = 10, psi = 0.5, sigma = 1)
#' createBetaArray <- function(original, rho = 0.5)
#'
#' @export

createBetaArray <- function(original,
                            rho = 0.5) {
  size <- length(original)
  betaArray <- array(NA, dim = c(size-1, size))

  lag = 1
  while ((size - lag) > 0) {
    for (rowIndex in 1:(size - 1)) {
      for (colIndex in 1:(size - lag + 1)) {
        betaArray[rowIndex, colIndex] <-
          original[rowIndex] *
          (original[colIndex + lag - 1] - rho[rowIndex] * original[rowIndex])
      }
      lag = lag + 1
    }
  }
  betaArray [, 1] = 0
  betaArray = betaArray / gamma0
  # betaArray <- array(as.numeric(unlist(betaArray)), dim = c(size-1, size))
  # betaArray <- as.data.frame(betaArray)
  # colnames(betaArray) <- as.character(0:(length(original) - 1))
  betaArray
}
