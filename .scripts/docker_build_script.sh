#!/bin/bash

## Set directories
CURR=`pwd`

ROCKER_DIR=/Users/ni41435_lca/Documents/bioc/rocker-versioned

R_VER=${ROCKER_DIR}/r-ver/

RSTUDIO=${ROCKER_DIR}/rstudio/

BIOCONDUCTOR_DOCKER=/Users/ni41435_lca/Documents/bioc/bioconductor_docker

echo \
    "The paths being set are:

    ROCKER_DIR : ${ROCKER_DIR}
    R_VER: ${R_VER}
    RSTUDIO: ${RSTUDIO}
    BIOCONDUCTOR_DOCKER: ${BIOCONDUCTOR_DOCKER}
    "

## 1. Set rocker directory remotes
## 2. make sure origin is up to date with upstream/master
echo "Making sure we are 'master' branch of ${ROCKER_DIR}: \n"

git -C $ROCKER_DIR checkout master

git -C $ROCKER_DIR pull

## Make sure we on master branch on Bioconductor
echo "Making sure we are 'master' branch of ${BIOCONDUCTOR_DIR}: \n"
git -C $BIOCONDUCTOR_DOCKER checkout master


# Docker builds in sequential order

###########
## First
###########
echo "1. Build ${R_VER}/devel.Dockefile \n"

cd $R_VER
echo "docker build -t rocker/r-ver:devel -f ${R_VER}/devel.Dockerfile"

###########
## Second
###########
echo "2. Build ${RSTUDIO}/devel.Dockefile \n"

cd $RSTUDIO
echo "docker build -t rocker/rstudio:devel -f ${RSTUDIO}/devel.Dockerfile"

###########
## Third
###########
echo "3. Build ${BIOCONDUCTOR_DOCKER}/Dockefile: \n"

cd $BIOCONDUCTOR_DOCKER

### modify the version number
echo "3.1 Change version number on ${BIOCONDUCTOR_DOCKER}/Dockerfile: \n"


### build
echo "docker build -t bioconductor/bioconductor_docker -f Dockerfile"

echo "docker push bioconductor/bioconductor_docker:devel"

### Push to git
#git -C $BIOCONDUCTOR_DOCKER push origin master

cd $CURR
