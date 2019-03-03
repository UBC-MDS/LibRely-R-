#' Document the dependancies
#'
#' Input a R script to prepare a markdown file documenting the dependancies. These can be included in a project
#' Readme file.
#'
#' @param script a .R file
#'
#' @return markdown
#' @export
#'
#' @examples
#' lib_lines("script.R")
#' 
lib_lines <- function(script){
  script <- readLines(script)
  script <- script[which(script!="")]     # delete the blank space
  script <- script[which(!grepl("^#", script))]    # delete the comment lines
  
  # total number of lines of the script
  num_line <- length(script)
  
  # total number of characters of the script
  num_char <- sum(nchar(script))
  
  a <- list()
  a$num_line <- num_line
  a$num_char <- num_char
  return(a)
}

