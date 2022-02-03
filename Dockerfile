# This docker image has LaTeX to build the vignettes
FROM bioconductor/bioconductor_docker:devel

LABEL name="nturaga/bioconductor_build_docker" \
      maintainer="nturaga.bioc@gmail.com" \
      version="3.15.0" \
      description="Bioconductor docker image for the linux build machine"

RUN apt-get update \
	## Install sklearn and pandas on python
	&& pip3 install scipy \
		numpy \
		h5py \
		mofapy \
		mofapy2 \
		tensorflow \
		tensorflow_probability \
		h5pyd \
		nbconvert \
		jupyter \
		matplotlib \
		phate \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*



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
	libhiredis-dev \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# Required packages, so these are latest no matter what
RUN R -e 'BiocManager::install(c("BiocStyle", "devtools", "BiocCheck", "roxygen2", "testthat", "knitr"))'
