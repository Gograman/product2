#' @title saveProductCol
#'
#' @name saveProductCol
#'
#' @aliases saveProductCol
#'
#' @description saveProductCol
#'
#' @param dataframe dataframe
#'
#' @return a CSV file
#'
#' @examples
#'
#' @export

saveProductCol <- function(dataframe) {
  nameOfFile <-
    dir.create(file.path("./", "export"), showWarnings = FALSE)
  write.csv(dataframe, file = "export/productColExported.csv")


}
