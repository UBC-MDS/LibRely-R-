#' Document the dependancies
#'
#' Input a R script to prepare a markdown file documenting the dependancies. These can be included in a project
#' Readme file.
#'
#' @param path a .R file
#'
#' @return markdown
#' @export
#'
#'
lib_lines <- function(path){

  if(!grepl(".R", path)) return("The input should be a .R script")
  if(!file.exists(path)) return("The file does not exist")

  tryCatch({
    script <- readLines(path)
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
    },

    error = function(c) "Error",
    warning = function(c) "Warning",
    message = function(c) "Message"
  )
}
