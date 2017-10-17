#' @title drawCvsCHat
#
#' @name drawCvsCHat
#'
#' @aliases drawCvsCHat
#'
#' @description
#'
#' @param cMatrix cMatrix
#' @param cHatMatrix cHatMatrix
#'
#' @return picture
#'
#' @examples
#'
#' @export

drawCvsCHat <-  function(cMatrix, cHatMatrix) {
  iCount = min(dim(cMatrix)[2],
               dim(cHatMatrix)[2])

  for (i in 1:iCount) {
    full.name = paste0("barplot_cHatMatrix_vs_cMatrix_lag_", i, ".jpeg")
    plot.path <- file.path("./", "plots", full.name)
    jpeg(plot.path)
    tmpMin <- min(cHatMatrix[, i], cMatrix[, i])
    tmpMax <- max(cHatMatrix[, i], cMatrix[, i])
    tmpMatrix <- rbind(cHatMatrix[, i][1:iCount],
                       cMatrix[, i][1:iCount])
    rownames(tmpMatrix) <- c("C Hat", "C")
    barplot(tmpMatrix,
      beside = T,
      ylim = c(tmpMin - 1, tmpMax + 1),
      xlim = c(0, iCount + 2),
      col = c("dark grey", "black"),
      legend = rownames(tmpMatrix),
      main = bquote(paste(
        "C matrix vs ", hat(C), " matrix, lag = ", .(i - 1))))
    graphics.off()
  }
}
