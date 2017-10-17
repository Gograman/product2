#' @title createOriginalMA1
#'
#' @name createOriginalMA1
#'
#' @aliases createOriginalMA1
#'
#' @description createOriginalMA1
#'
#' @param size size
#' @param psi psi
#' @param sigma sigma
#'
#' @return originalMA1
#'
#' @examples
#'
#' @export

createOriginalMA1 <- function(size,
                           psi,
                           sigma) {
  stats::arima.sim (n = size,
                    model = list(ma = c(psi)),
                    sd = sigma)
}
