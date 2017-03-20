drawCvsCHat <-  function(cMatrix, cHatMatrix) {
  for (i in 1:lagCount) {
    full.name = paste0("barplot_cHatMatrix_vs_cMatrix_lag_", i, ".jpeg")
    plot.path <- file.path("./", "plots", full.name)
    jpeg(plot.path)
    tmpMin <- min(cHatMatrix[, i], cMatrix[, i])
    tmpMax <- max(cHatMatrix[, i], cMatrix[, i])
    tmpMatrix <- rbind(cHatMatrix[, i][1:lagCount], 
                       cMatrix[, i][1:lagCount])
    rownames(tmpMatrix) <- c("C Hat", "C")
    barplot(tmpMatrix,
      beside = T,
      ylim = c(tmpMin - 1, tmpMax + 1),
      xlim = c(0, lagCount + 2),
      col = c("dark grey", "black"),
      legend = rownames(tmpMatrix),
      main = bquote(paste(
        "C matrix vs ", hat(C), " matrix, lag = ", .(i - 1))))
    graphics.off()
  }
}
