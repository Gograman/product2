#' @title createProductColReplicated
#'
#' @name createProductColReplicated
#'
#' @aliases createProductColReplicated
#'
#' @description createProductColReplicated
#'
#' @param originalReplicated originalReplicated
#' @param size size
#' @param replicationCount replicationCount
#'
#' @return productColReplicated
#'
#' @examples
#'
#' @export

createProductColReplicated <- function(originalReplicated, size, replicationCount) {

  prodColReplicated <- apply(X = originalReplicated,
                             MARGIN = 1,
                             FUN = createProductCol)
  prodColReplicated <- array(as.numeric(unlist(prodColReplicated)),
                             dim=c(size, size, replicationCount))
}
