drawPacf <- function(pacfDF, lagCount) {
  dir.create(file.path("./", "plots"), showWarnings = FALSE)
  
  for (i in 1:lagCount) {
    # otherwise, for (i in 1:dim(AcfDF)[2]))
    full.name = paste0("product_pacf_lag_", i - 1, ".jpeg")
    plot.path <- file.path("./", "plots", full.name)
    jpeg(plot.path)
    pacfOfIthElement <- unlist(pacfDF[1, i])
    names(pacfOfIthElement) <- 1:length(pacfOfIthElement)
    barplot(pacfOfIthElement, width = 0.5,
            main = bquote(paste("Product PACF, lag = ", .(i - 1))))
    graphics.off()
  }
}