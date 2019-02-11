#' Find dependant packages
#'
#' Input a R script to find all the dependant packages used and create a character vector with all of their names.
#'
#' @param script a .R file
#'
#' @return vector
#' @export
#'
#' @examples
#' lib_search("script.R")
lib_search <- function(path){

  script <- readLines(path)

  library_lines <- script[grep(pattern = "library\\(.*\\)", script)]

  pkgs <- sub(pattern = "library\\((.*)\\).*", "\\1", library_lines)

  return(pkgs)
}



library("ggplot2")
