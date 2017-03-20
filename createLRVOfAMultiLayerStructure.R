createLRVOfAMultiLayerStructure <- function(aMultiLayerStructure,
                                            replicationCount) {
  sqrtRC <- sqrt(replicationCount)
  tempLRV <- c()
  #for (i in 1:dim(tempLRV)[1]) {
    for (j in 1:dim(productColReplicated)[3]) {
      tempLRV <- rbind(tempLRV,
                       apply(productColReplicated[, , j],
                           MARGIN = 2,
                           function (x) {
                             mean(x, na.rm = T)
                           }))
    }
  
  LRV <- tempLRV * sqrtRC
}
