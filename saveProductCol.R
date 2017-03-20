saveProductCol <- function(dataframe) {
  nameOfFile <- 
    dir.create(file.path("./", "export"), showWarnings = FALSE)
  write.csv(dataframe, file = "export/productColExported.csv")
  
}
