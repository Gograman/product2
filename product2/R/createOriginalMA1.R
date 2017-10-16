#' @title createOriginalMA1
#'
#' @name
#'
#' @aliases
#'
#' @description
#'
#' @param
#'
#' @return
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
