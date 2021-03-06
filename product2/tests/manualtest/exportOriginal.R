#' @title exportOriginal
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

exportOriginal <- function(original) {
  dir.create(file.path("./", "export"), showWarnings = FALSE)
  # Building the CSV file name (as long as size, psi & sigma are present
  # in the global env-t)
  full.name = paste0("original_size_", size,
                     "_psi_", psi,
                     "_sigma_", sigma,
                     ".csv")
  csv.path <- file.path("./", "export", full.name)
  write.csv(x = original, file = csv.path)
}
