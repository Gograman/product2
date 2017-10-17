#' @title createLRVof2dArray
#'
#' @name createLRVof2dArray
#'
#' @aliases createLRVof2dArray
#'
#' @description createLRVof2dArray
#'
#' @param array2d array2d
#'
#' @return LRVof2dArray
#'
#' @examples
#'
#' @export

createLRVof2dArray <- function(array2d) {
  # for each line we calculate average
  # and take variance  of those averages
  # multiply the result by a sqrt of a row count
  # Issue of rows and columns
  # Bars for each row
  # Then variance for all the results
  # corrected 1 to 2
  # here we do not transpose because it was already transposed on 3d level


  naCountInARowVector = rowSums(is.na(array2d))

  naCountInARow = naCountInARowVector[1]
  colCountNoNA = dim(array2d) [2] - naCountInARow
  array2dNoNA <- array2d[, 1:colCountNoNA]
  rowMeansArray <- rowMeans(array2dNoNA)

  lrv <- colCountNoNA * var(rowMeansArray)
  lrv
}


