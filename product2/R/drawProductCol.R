#' @title drawProductCol
#
#' @name drawProductCol
#'
#' @aliases drawProductCol
#'
#' @description Drawing a plot of \code{ProductCol} values. Exporting it to a JPEG file saved to \code{"./plots"} directory.
#'
#' @param productCol productCol 
#' @param size size 
#' @param mean mean 
#' @param sigma sigma 
#' @param lagCount lagCount 
#' @param darkestColor darkestColor 
#' @param lightestColor lightestColor 
#'
#' @return A JPEG file located at \code{"./plots"} directory.
#'
#' @examples
#' original <- createOriginalMA1(size = 10, psi = 0.5, sigma = 1)
#' productCol <- createProductCol(original)
#' drawProductCol(productCol, size = 10, mean = 0, sigma = 1, lagCount = 2, darkestColor = "dark blue", lightestColor = "white"
#'
#' @export

drawProductCol <- function(productCol,
                           size,
                           mean,
                           sigma,
                           lagCount,
                           darkestColor = "dark blue",
                           lightestColor = "white"
) {
  colfunc <- colorRampPalette(c(darkestColor, lightestColor))
  # pie(rep(1, size), col = colfunc(size))

  # The array of RGB codes
  colfunc(size)

  dir.create(file.path("./", "plots"), showWarnings = FALSE)
  # Forming a path to the exported products image
  full.name = paste0("productCol_",
                     "size_",
                     size,
                     "_mean_",
                     mean,
                     "_sigma_",
                     sigma,
                     ".jpeg")
  plot.path <- file.path("./", "plots", full.name)
  jpeg(plot.path)
  matplot(
    y = productCol[, 1:lagCount],
    type = 'l',
    lty = 1,
    col = colfunc(lagCount)
  )
  graphics.off()
}
