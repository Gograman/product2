createLRVof3dArray <- function(array3d) {
  # array3d is a 3-D array of the following setup:
  # array3d[rowCount, colCount, replicationCount]
  # reference to one level down
  colCount = dim (array3d) [2]
  # output
  lrvArray = array (NA, dim = colCount)
  for (colIndex in 1 : colCount)
  {
    lrvArray [colIndex] = createLRVof2dArray (array3d [, colIndex, ])
  }
  
  lrvArray
}
