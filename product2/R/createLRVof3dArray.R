#' @title createLRVof3dArray
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

createLRVof3dArray <- function(array3d) {
  # array3d is a 3-D array of the following setup:
  # array3d[rowCount, colCount, replicationCount]
  # reference to one level down

  colCount = dim (array3d) [2]
  # subtracted 1 colCount-1 because it complained about dimensions
  lrvArray = array (NA, dim = (colCount-1))
  for (colIndex in 1:(colCount-1))
  # lrvArray = array (NA, dim = (colCount))
  # for (colIndex in 1:(colCount))
    {

    transposed2d <- t(array3d[ , colIndex, ])
    lrvArray [colIndex] = createLRVof2dArray(transposed2d)

  }

  lrvArray
}
