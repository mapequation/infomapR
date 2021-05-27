#' InfomapR
#' 
#' Infomap R package, wrapped by SWIG
#' 
#' @docType package
#' @author you
#' @useDynLib infomap, .registration=TRUE
#' @exportPattern "^[[:alpha:]]+"
#' @name infomap
#' @include infomap.R
NULL


#' @export
test_r <- function() {
  print("test_r works!")
  42
}

#' Test Infomap example
#' @param flags Infomap parameters
#' @export
test_example <- function(flags="") {
  print("Test Infomap example..")
}
