createLRVof2dArray <- function(array2d) {
  # for each line we calculate average
  # and take variance  of those averages
  # multiply the result by a sqrt of a row count
  sqrtRcCount = sqrt(dim(array2d) [2])
  rowMeansArray <- apply(array2d, MARGIN = 2, function(x) { 
    mean(x, na.rm = T) 
    } 
  )
  lrv <- sqrtRcCount * var(rowMeansArray)
  lrv
}
