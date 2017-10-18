#' @title createOriginalMA1
#'
#' @name createOriginalMA1
#'
#' @aliases createOriginal
#'
#' @description Creating a one-dimensional array using \code{stats::arima.sim()}, passing \code{size}, \code{sigma} and \code{psi} (\code{psi} being the argument of the model).
#'
#' @param size size
#' @param psi psi
#' @param sigma sigma
#'
#' @return Returninng a one-dimensional array of size \code{size}.
#'
#' @examples
#' createOriginalMA1(size = 10, psi = 0.5, sigma = 1)
#'
#' @export

createOriginalMA1 <- function(size,
                           psi,
                           sigma) {
  stats::arima.sim (n = size,
                    model = list(ma = c(psi)),
                    sd = sigma)
}
