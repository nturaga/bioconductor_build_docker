# Linux Build Docker container for Bioconductor

This image has the full installation of LaTeX.

## Usage

To use this image interactively,

```
docker run -it \
	-v ~/shared/devel/library-store/:/usr/local/lib/R/host-site-library 
	-v ~/Documents/:/home/bioc/Documents 
	--user bioc 
	ghcr.io/nturaga/bioconductor_build_docker:master bash
```

This command will mount a `library-store` path, where all the
installed packages will be shared. It will also mount a folder called
`Documents` which has my required files and folders to work on using R
/ RStudio. The user will be `bioc`. The entrypoint for the container
will be a `bash` shell.

It is possible to run,

```
R CMD build <package_name>

R CMD check <package_name_x.y.z.tar.gz>
```

It is also easy to run the library `BiocCheck` on packages as needed.

## Availability

The image is available at `ghcr.io/nturaga/bioconductor_build_docker:master`

```
docker pull ghcr.io/nturaga/bioconductor_build_docker:master
```

