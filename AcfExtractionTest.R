x = 1:10

acfX <- acf (x)
typeof(acfX)
acfX[-1]
# extract acf and make a barplot
acfX

acfExtracted <- as.numeric(unlist(acf(x)[, 1][1:10]))
acfExtracted <- acfExtracted[1:10]
barplot(acfExtracted)
acf (x)
round (acfExtracted, digits=3)
acfExtracted0 <- acfExtracted[-2:9]
round (acfExtracted0, digits=3)

# draw acf by the regular function
# extract acf from that function
# draw baplot from that acf
# compare both visually

myX = 1:5
myX [5]
myX [6]
myX [(-10)]


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
