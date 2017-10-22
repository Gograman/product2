#' @title saveJpg
#'
#' @name saveJpg
#'
#' @aliases saveJPG
#'
#' @description Drawing a barplot of side-by-side values of \code{dMatrix} and \code{dHatMatrix} values. Exporting it to a JPEG file saved to \code{path()} directory.
#'
#' @param fileName A string defining the path to the file that is going to be used to store the picture.
#'
#' @return No data structures returned. Saving a JPEG file located in \code{path()} directory.
#'
#' @examples
#'
#'@export

saveJpg <- function(fileName, path)
{
  if(!dir.exists(path))
  {
    dir.create(path)
  }

  fileName <- gsub("\\.","", fileName)


  fileName <- gsub(" ","_", paste0(fileName,".jpg"))
  fileName <- gsub(":", "_", fileName)
  jpeg(paste0(path, "/", fileName))
}
