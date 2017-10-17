#' @title createOriginal
#'
#' @name createOriginal
#'
#' @aliases createOriginal
#'
#' @description createOriginal
#'
#' @param size size
#' @param psi psi
#' @param sigma sigma
#'
#' @return
#'
#' @examples
#'
#' @export

createOriginal <- function(size = 10,
                           psi = 0.5,
                           sigma = 1) {
  stats::arima.sim (n = size,
                    model = list(ma = c(psi)),
                    sd = sigma)
}
