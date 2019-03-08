#' Report and count the functions used
#'
#' Input a R script to find and count all the functions used in each respective package
#'
#' @param path a .R file
#'
#' @return dataframe
#' @export
#'

lib_count <- function(path){

  if(!grepl(".R", path)) return("The input should be a .R script")
  if(!file.exists(path)) return("The file does not exist")

  suppressPackageStartupMessages(require(tidyverse))


    script <- readLines(path)

    library_lines <- script[grep(pattern = "library\\(.*\\)", script)]
    pkgs <- sub(pattern = "library\\((.*)\\).*", "\\1", library_lines)

    # Confirm all packages are installed, otherwise return a vector of pkgs to install
    missing_pkgs <- pkgs[!is.element(pkgs, installed.packages())]


    # Load the nessecary libraries
    pkgs <- pkgs[is.element(pkgs, installed.packages())]

    # to check with empty script
    if (identical(pkgs, character(0)) ) {

      return(cat("This is an empty script"))
    }

    else{

      for(pkg in pkgs){
        require(pkg,character.only=TRUE,quietly=TRUE)
      }

      # Find and create dataframe of packages and functions
      pkg_list <- purrr::map(.x = paste("package:", pkgs, sep = ""), ls)
      names(pkg_list) <- pkgs

      pkg_df <- as_tibble(suppressWarnings(purrr::map_df(pkg_list, ~as.data.frame(.x), .id= "package_name")) %>%
                            rename( "function_name" = ".x"))

      # Count the usage of functions in the script
      pkg_df <- pkg_df %>%
        mutate(count = stringr::str_count(pattern = paste(function_name,"\\(", sep = ""),
                                 string = paste(script, collapse = ""))) %>%
        filter(count > 0)

      return(pkg_df)
    }
  }
