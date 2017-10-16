#' @title drawDvsDHat
#
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

drawDvsDHat <-  function(dMatrix, dHatMatrix) {
  iCount = min(dim(dMatrix)[2],
               dim(dHatMatrix)[2])
  for (i in 1:iCount) {
    full.name = paste0("barplot_dMatrix_vs_dHatMatrix_lag_", i - 1, ".jpeg")
    plot.path <- file.path("./", "plots", full.name)
    jpeg(plot.path)
    tmpMin <- min(dHatMatrix[, i], dMatrix[, i])
    tmpMax <- max(dHatMatrix[, i], dMatrix[, i])
    tmpMatrix <- rbind(dHatMatrix[, i][1:iCount],
                       dMatrix[, i][1:iCount])
    rownames(tmpMatrix) <- c("D Hat", "D")
    barplot(tmpMatrix,
      beside = T,
      ylim = c(tmpMin - 1, tmpMax + 1),
      xlim = c(0, iCount + 2),
      col = c("dark grey", "black"),
      legend = rownames(tmpMatrix),
      main = bquote(paste(
        "D matrix vs ", hat(D), " matrix, lag = ", .(i - 1))))
    graphics.off()
  }
}
