#' Find dependant packages
#'
#' Input a R script to find all the dependant packages used and create a character vector with all of their names.
#'
#' @param script a .R file
#'
#' @return vector
#' @export
#'
lib_search <- function(path){
  if(grepl(".R", path) == TRUE& is.character(path) == TRUE & file.exists(path) == TRUE){

    script <- readLines(path)

    library_lines <- script[grep(pattern = "library\\(.*\\)", script)]

    pkgs <- sub(pattern = "library\\((.*)\\).*", "\\1", library_lines)

    return(pkgs)
  }
  else{
    return("The input should be a .R script")
  }

}




