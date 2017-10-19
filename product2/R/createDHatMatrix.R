#' @title createDHatMatrix
#'
#' @name createDHatMatrix
#'
#' @aliases createDHatMatrix
#'
#' @description Creating a two-dimensional array of dimensions \code{c(size - 1, size - 1)}.
#'
#' @param betaArray betaArray
#' @param size The size of the one-dimensional array \code{original}..
#'
#' @return Returning a two-dimensional array of dimensions \code{c(size - 1, size - 1)}.
#'
#' @examples
#' original <- createOriginalMA1(size = 10, psi = 0.5, sigma = 1)
#' betaArray <- createBetaArray <- function(original, rho = 0.5)
#' createDHatMatrix(betaArray, size = 10)
#'
#' @export

createDHatMatrix <- function(betaArray,
                             size) {
  # Eliminating all NA's
  betaArrayWithoutNA <- apply(betaArray[ , -1], MARGIN = 2, na.exclude)

  # Creating an empty list
  dHatList <- vector("list", size - 1)

  # Filling cHatList with ACF values
  for (i in 1:(size - 1)) {
    acfOfIthBetaArrayWithoutNA <- acf(betaArrayWithoutNA[[i]],
                                      type = "covariance")
    dHatList[[i]] <- as.vector(
      unlist(
        acfOfIthBetaArrayWithoutNA$acf))
  }

  # Building the final matrix,
  # complementing the missing values with NA's
  dHatMatrix <- array(0, dim = c(length(unlist(dHatList[[1]])),
                                 size - 1))
  #
  for (i in 1:(size - 1)) {
    difLength <- dim(dHatMatrix)[1] - length(unlist(dHatList[i]))
    ifelse(difLength == 0,
           dHatMatrix[, i] <- unlist(dHatList[i]),
           dHatMatrix[, i] <- c(unlist(dHatList[i]),
                                rep(0, difLength)))
  }

  dHatMatrix <- cbind(0, dHatMatrix)
  dHatMatrix
}
