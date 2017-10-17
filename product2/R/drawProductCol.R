#' @title drawProductCol
#
#' @name
#'
#' @aliases
#'
#' @description
#'
#' @param productCol productCol 
#' @param size size 
#' @param mean mean 
#' @param sigma sigma 
#' @param lagCount lagCount 
#' @param darkestColor darkestColor 
#' @param lightestColor lightestColor 
#'
#' @return picture file
#'
#' @examples
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
