# This docker image has LaTeX to build the vignettes
FROM bioconductor/bioconductor_docker:devel

LABEL name="nturaga/bioconductor_build_docker" \
      maintainer="nitesh.turaga@gmail.com"

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
 	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

RUN R -e 'BiocManager::install(c("BiocStyle", "devtools"))'

CMD ["sh"]
