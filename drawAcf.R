drawAcf <- function(acfDF, lagCount) {
  dir.create(file.path("./", "plots"), showWarnings = FALSE)
  
  for (i in 1:lagCount) {
    full.name = paste0("product_acf_lag_", i - 1, ".jpeg")
    plot.path <- file.path("./", "plots", full.name)
    jpeg(plot.path)
    # Need to be flattened to vectors
    acfOfIthElement <- unlist(acfDF[1, i])
    names(acfOfIthElement) <- 1:length(acfOfIthElement)
    barplot(acfOfIthElement, width = 0.5,
            main = bquote(paste("Product ACF, lag = ", .(i - 1))))
    graphics.off()
  }
}