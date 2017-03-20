createDiffCMatrix_vs_CHatMatrix <- function(cMatrix, 
                                            cHatMatrix, 
                                            lagCount = 10) {
    matDim <- c(min(dim(cMatrix)[1], dim(cHatMatrix)[1]),
              min(dim(cMatrix)[2], dim(cHatMatrix)[2])
              )
    # diff_cMatrix_vs_cHatMatrix <- array(NA, dim = c(matDim[1], matDim[2]))
    diff_cMatrix_vs_cHatMatrix <<- cMatrix[1:matDim[1], 1:matDim[2]] - 
                                  cHatMatrix[1:matDim[1], 1:matDim[2]]

  # Exporting plots of differences
  lagCount = min(c(lagCount, matDim[2]))
  for (i in 1:lagCount) {
    dir.create(file.path("./", "plots"), showWarnings = FALSE)
    full.name = paste0("diff_cMatrix_vs_cHatMatrix_lag_", i - 1, ".jpeg")
    plot.path <- file.path("./", "plots", full.name)
    jpeg(plot.path)
    # Need to be flattened to vectors
    ithElement <- unlist(diff_cMatrix_vs_cHatMatrix[, i])
    barplot(
      ithElement,
      width = 0.5,
      xlim = c(0, lagCount),
      main = bquote(paste(
        "Difference of C and ", hat(C), " matrices, ",
        "lag = ", .(i - 1)
      ))
    )
    graphics.off()
  }
}
