install.packages("devtools")
install.packages("roxygen2")

vignette("namespace")

# Create repo
setwd("..")
devtools::create("InfomapR")
setwd(".")
usethis::use_vignette("introduction")
devtools::document()

# devtools::build()
# devtools::build(binary = T)
