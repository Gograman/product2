cHat <- sapply(apply(
    productCol, MARGIN = 2, na.exclude), 
  function(x) { acf(x, type = "covariance") } )

cHatMatrix <- array(0, dim = c(size - 1, size - 1))

for (i in 1:(size - 1)) {
  difLength <- size - 1 - length(unlist(cHat[1, i]))
  ifelse(
    difLength == 0,
    cHatMatrix[i, ] <- unlist(cHat[1, i]),
    cHatMatrix[i, ] <- c(unlist(cHat[1, i]),
                         rep(0, difLength)))
}

x = apply(productCol, MARGIN = 2, na.exclude)
y = sapply(x, function(x) { acf(x, type = "covariance") } )
y
