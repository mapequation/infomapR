.PHONY: create get-infomap build-binary document install test-R clean

build: get-infomap Infomap/build/R/infomap.R R/infomap.R src/infomap_wrap.cpp
	@true

get-infomap: master.zip Infomap
	@true

master.zip:
	curl -LO https://github.com/mapequation/infomap/archive/refs/heads/master.zip

Infomap:
	unzip master.zip
	mv infomap-master Infomap

Infomap/build/R/infomap.R:
	cd Infomap && make R

R/infomap.R:
	cp Infomap/build/R/infomap.R R/

src/infomap_wrap.cpp:
	cp -r Infomap/build/R/* src/
	rm -rf src/Infomap

build-binary:
	mkdir -p binary
	R --no-save -e 'library(devtools); devtools::build(pkg = ".", path = "./binary", binary = T)'

pre-document:
	R --no-save -e 'library(pkgbuild); pkgbuild::compile_dll()'

check-version:
	R --no-save -e 'library(roxygen2); sessionInfo()'

document:
	R --no-save -e 'library(devtools); library(roxygen2); document()'

create:
	cd .. && R --no-save -e 'devtools::create("InfomapR")'

install:
	cd .. && R --no-save -e 'devtools::install("InfomapR")'

test-R:
	pwd
	cd $(R_PACKAGE) && R --no-save -e 'library(devtools); library(roxygen2); load_all(); test()'

clean:
	$(RM) -r build Infomap master.zip binary src/*.* src/src
	