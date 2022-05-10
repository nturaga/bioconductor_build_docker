# Linux Build Docker container for Bioconductor

Author: Nitesh Turaga

**devel**: [![Docker Build and Publish on ghcr.io](https://github.com/nturaga/bioconductor_build_docker/actions/workflows/docker-publish.yml/badge.svg?branch=master)](https://github.com/nturaga/bioconductor_build_docker/actions/workflows/docker-publish.yml)

**RELEASE_3_15**: [![Docker Build and Publish on ghcr.io](https://github.com/nturaga/bioconductor_build_docker/actions/workflows/docker-publish.yml/badge.svg?branch=RELEASE_3_15)](https://github.com/nturaga/bioconductor_build_docker/actions/workflows/docker-publish.yml)

This image has the full installation of LaTeX and ESS (emacs speaks statistics) for R users.

## Availability

The image is available at `ghcr.io/nturaga/bioconductor_build_docker:master`

```
docker pull ghcr.io/nturaga/bioconductor_build_docker:master
```

## Usage - ESS

You can now use Emacs and ESS to use R on this repository.

	docker run -it \
		-u rstudio \
    	-v ${HOME}/R/bioconductor_docker/3.15:/usr/local/lib/R/host-site-library
		ghcr.io/nturaga/bioconductor_build_docker:master bash
		
Once you login as rstudio user, use `emacs`, and then the below
command should start up R.

	M-x R <RET>

## Usage - with Docker Compose

Clone the repo, and within the directory run the command to start
RStudio served at http://localhost:8787/

```
## To start the image and RStudio 
docker-compose up -d

## To stop the image
docker-compose down
```

You can also get access to a `root` user to install ubuntu
libraries. If a package is missing a library that you need to install
as a system requirement, you can log in as root user and install the
library.

```
docker exec -it bioc-<devel-version> bash
```

While installing the library, be sure to use 

	apt-get update && apt-get install <ubuntu-librarye>

### Running build and check

It is possible to run within the RStudio terminal window

	R CMD build <package_name>

	R CMD check <package_name_x.y.z.tar.gz>

You can even run it within the R consolve with

	devtools::build('package_name')

	devtools::check('package_name')
	
	BiocCheck::BiocCheck('package_name')

## FAQ 

1. Cannot open vignette with `browseVignettes('SummarizedExperiment')`
   in a new window. The URL that it tries to open is

		http://localhost:8787/library/SummarizedExperiment/doc/SummarizedExperiment.html

	This is because RStudio serves this under a different link, i.e it
	prefixes the 'help/' before the 'library/' in the URL. (because it
	wants to open it under the 'Help' pane within RStudio)

	Please try, (notice the URL '/help/library/')

		http://localhost:8787/help/library/SummarizedExperiment/doc/SummarizedExperiment.html

2. Interactive Use (not recommended)

You can also use this image interactively as the 'root' user. If the
volumes shared don't exist, the image will not work as expected.

```
# First create volumes to share with Docker image.
mkdir -p $HOME/R/bioconductor_docker/3.14
mkdir -p $HOME/R/bioconductor_docker/data

# Use the docker image interactively if you need to as 'root'.
docker run -it \
	-v ${HOME}/R/bioconductor_docker/3.14:/usr/local/lib/R/host-site-library
    -v ${HOME}/R/bioconductor_docker/data:/home/rstudio
	ghcr.io/nturaga/bioconductor_build_docker:master bash
```

This command will mount a library-store path called
`$HOME/R/bioconductor_docker/3.14`, where all the installed packages
will be shared. It will also mount a folder called
`$HOME/R/bioconductor_docker/data` which has data, required files etc
you wish to share.  It is also going to start the user within a 'bash'
session, on the terminal.


## Issues

This is an experimental repository. Please open issues in the issues
tab with detailed error messages and screenshots as required.
