#' @title saveProductCol
#'
#' @name saveProductCol
#'
#' @aliases saveProductCol
#'
#' @description Saving two-dimensional array \code{original} to a CSV file saved to \code{./export} directory.
#'
#' @param dataframe dataframe
#'
#' @return A CSV file located in \code{./export} directory.
#'
#' @examples
#' original <- createOriginalMA1(size = 10, psi = 0.5, sigma = 1)
#' productCol <- createProductCol(original)
#' saveProductCol(productCol)
#'
#' @export

saveProductCol <- function(dataframe) {
  nameOfFile <-
    dir.create(file.path("./", "export"), showWarnings = FALSE)
  write.csv(dataframe, file = "export/productColExported.csv")
}
