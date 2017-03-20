myArray = c (1, 2, 3, NA)
mean (myArray, na.rm = T)
mean (myArray, na.rm = F)




zeroArray = rep (x = 0, times = 10)
acf (zeroArray, type = "covariance")

oneArray = rep (x = 1, times = 10)
acf (oneArray, type = "covariance")

growingArray = 1:10
acf (growingArray, type = "covariance")

array3d <- productColReplicated

colCount = dim (array3d) [2]
replicationCount = dim (array3d) [3]
# output
lrvArray = array (NA, dim = colCount)
array3d [, 1, 1:(replicationCount - 1 + 1)
         array3d [, 2, 1:(replicationCount - 2 + 1)
                  
createLRVof2dArray(array3d [, 1, 1:(replicationCount - 1 + 1)])
createLRVof2dArray(array3d [, 2, 1:(replicationCount - 2 + 1)])
                  
createLRVof2dArray(array3d [, 2,])
createLRVof2dArray(array3d [, 3,])
                  
for (colIndex in 1:colCount)
{
lrvArray [colIndex] = createLRVof2dArray
(array3d [, colIndex, 1:(replicationCount - colIndex + 1)])
}

lrvArray
                  