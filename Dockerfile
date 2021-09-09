# This docker image has LaTeX to build the vignettes
FROM bioconductor/bioconductor_docker:devel

LABEL name="nturaga/bioconductor_build_docker" \
      maintainer="nturaga.bioc@gmail.com" \
      version="3.14.1" \
      description="Bioconductor docker image for the linux build machine"

# Update apt-get
RUN apt-get update \
	&& apt-get install -y --no-install-recommends apt-utils \
	&& apt-get install -y --no-install-recommends \
	texlive \
	texlive-latex-extra \
	texlive-fonts-extra \
	texlive-bibtex-extra \
	texlive-science \
	texi2html \
	texinfo \
	qpdf \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# Required packages, so these are latest no matter what
RUN R -e 'BiocManager::install(c("BiocStyle", "devtools", "BiocCheck", "roxygen2", "testthat", "knitr"))'
