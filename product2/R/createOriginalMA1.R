createOriginalMA1 <- function(size,
                           psi,
                           sigma) {
  stats::arima.sim (n = size,
                    model = list(ma = c(psi)),
                    sd = sigma)
}
