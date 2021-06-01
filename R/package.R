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

  im <- infomap::InfomapWrapper("-2 -d")

  im$addLink(0, 1);
  im$addLink(0, 2);
  im$addLink(0, 3);
  im$addLink(1, 0);
  im$addLink(1, 2);
  im$addLink(2, 1);
  im$addLink(2, 0);
  im$addLink(3, 0);
  im$addLink(3, 4);
  im$addLink(3, 5);
  im$addLink(4, 3);
  im$addLink(4, 5);
  im$addLink(5, 4);
  im$addLink(5, 3);

  im$run();
}
