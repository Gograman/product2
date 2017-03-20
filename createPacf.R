createPacf <- function(productCol) {
  sapply(
    apply(
      productCol[ , 1:(size - 1)], 2, na.omit), 
    pacf)
}