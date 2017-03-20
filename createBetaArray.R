createBetaArray <- function(original,
                            rho = 0.5) {
  betaArray <- matrix(NA, nrow = size, ncol = size)
  
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
  betaArray <- as.data.frame(betaArray)
  colnames(betaArray) <- as.character(0:(length(original) - 1))
  betaArray
}