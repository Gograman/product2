#' @title createProductColReplicated
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

createProductColReplicated <- function(originalReplicated, size, replicationCount) {

  prodColReplicated <- apply(X = originalReplicated,
                             MARGIN = 1,
                             FUN = createProductCol)
  prodColReplicated <- array(as.numeric(unlist(prodColReplicated)),
                             dim=c(size, size, replicationCount))
}
