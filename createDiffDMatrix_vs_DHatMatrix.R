createDiffDMatrix_vs_DHatMatrix <- function(dMatrix, 
                                            dHatMatrix, 
                                            lagCount = 10) {
  matDim <- c(min(dim(dMatrix)[1], dim(dHatMatrix)[1]),
              min(dim(dMatrix)[2], dim(dHatMatrix)[2])
              )

  dMatrixToCompare <- dMatrix[1:matDim[1], 1:matDim[2]]
  dHatMatrixToCompare <- dHatMatrix[1:matDim[1], 1:matDim[2]]
  diff_dMatrix_vs_dHatMatrix <<- dMatrixToCompare - dHatMatrixToCompare
  
  # # Exporting plots of differences
  lagCount = min(c(lagCount, matDim[2]))
  for (i in 1:lagCount) {
  dir.create(file.path("./", "plots"), showWarnings = FALSE)
    full.name = paste0("diff_DMatrix_vs_DHatMatrix_lag_", i - 1, ".jpeg")
    plot.path <- file.path("./", "plots", full.name)
    jpeg(plot.path)
    # Need to be flattened to vectors
    ithElement <- unlist(diff_dMatrix_vs_dHatMatrix[, i])
    barplot(
      ithElement,
      width = 0.5,
      xlim = c(0, lagCount),
      main = bquote(paste(
        "Difference of D and ", hat(D), " matrices, ",
        "lag = ", .(i - 1)
      ))
    )
    graphics.off()
  }
  
}
