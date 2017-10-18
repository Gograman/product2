#' @title exportOriginal
#'
#' @name exportOriginal
#'
#' @aliases exportOriginal
#'
#' @description Exporting one- or two-dimensional array \code{original} to a CSV file saved to \code{./export} directory.
#'
#' @param original original
#'
#' @return A CSV file located in \code{./export} directory.
#'
#' @examples
#' original1d <- createOriginalMA1(size = 10, psi = 0.5, sigma = 1)
#' exportOriginal(original1d)
#' original2d <- createOriginalMA1Replicated(replicationCount = 10, size = 10, psi = 0.5, sigma = 1)
#' exportOriginal(original2d)
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
