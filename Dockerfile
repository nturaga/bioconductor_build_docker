# This docker image has LaTeX to build the vignettes
FROM bioconductor/bioconductor_docker:devel

ARG BIOCONDUCTOR_DOCKER_VERSION=3.10.2

LABEL name="bioconductor/bioconductor_docker" \
      version=$BIOCONDUCTOR_DOCKER_VERSION \
      maintainer="nitesh.turaga@gmail.com"

# Update apt-get
## RUN apt-get update \
## 	&& apt-get install -y --no-install-recommends apt-utils \
## 	&& apt-get install -y --no-install-recommends \
## 	texlive \
## 	texlive-latex-extra \
## 	texlive-fonts-extra \
## 	texlive-bibtex-extra \
## 	texlive-science \
## 	texi2html \
## 	texinfo \
## 	&& apt-get clean \
## 	&& rm -rf /var/lib/apt/lists/*

## RUN R -e 'BiocManager::install("BiocStyle")'
