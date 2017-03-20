createAcf <- function(x) {
  sapply(apply(x,
               MARGIN = 2,
               na.exclude),
         function(x) {
           acf(x, type = "covariance")
         })
}