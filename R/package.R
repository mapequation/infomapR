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

# TODO: define Infomap class with idiomatic R
# accessor methods for infomap::InfomapWrapper
# readInputData
# addNode
# addName
# getName
# getNames
# addPhysicalNode
# addStateNode
# addLink
# addMultilayerLink
# setBipartiteStartId
# getModules
# getMultilevelModules
# run
# codelength
# iterTree
# iterLeafNodes


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

  # im <- infomap::Infomap(twolevel = T, directed = T, ... = "--markov-time 0.9")

  im <- infomap::InfomapWrapper("-2 -d")

  im$readInputData("./network.net")

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

  cat("Partitioned network in", im$numTopModules(), "modules with codelength", im$codelength(), "bits:\n")

  it <- im$iterLeafNodes()

  while (!it$isEnd()) {
    cat("Node:", it$stateId, "module:", it$moduleId(), '\n')
    it$stepForward()
  }


  modules <- im$getModules()

}
