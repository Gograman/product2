createCHatMatrix <- function(productCol,
                             size) {
  # Eliminating all NA's
  prodColWithoutNA <- apply(productCol, MARGIN = 2, na.exclude)
  
  # Creating an empty list
  cHatList <- vector("list", size - 1)
  
  # Filling cHatList with ACF values
  for (i in 0:(size - 2)) {
    backtick <- '\x60'
    offsetName <- paste0("prodColWithoutNA$", backtick, i, backtick)
    ithProdColWithoutNA <- eval(parse(text = offsetName))
    acfOfIthProdColWithoutNA <-
      acf(ithProdColWithoutNA, type = "covariance")
    cHatList[[i + 1]] <- as.vector(unlist(acfOfIthProdColWithoutNA$acf))
  }
  
  # Building the final matrix,
  # complementing the missing values with NA's
  cHatMatrix <- array(0, dim = c(length(unlist(cHatList[[1]])),
                                 size - 1))
  #
  for (i in 1:(size - 1)) {
    difLength <- dim(cHatMatrix)[1] - length(unlist(cHatList[i]))
    ifelse(difLength == 0,
           cHatMatrix[, i] <- unlist(cHatList[i]),
           cHatMatrix[, i] <- c(unlist(cHatList[i]),
                                rep(0, difLength)))
  }
  
  cHatMatrix
}
