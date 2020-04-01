echo "Build bioconductor_docker image"


###############################################
## Step 0: Set up variables and clone
## Rocker repo
ROCKER_REPO=https://github.com/rocker-org/rocker-versioned
BIOCONDUCTOR_REPO=https://github.com/bioconductor/bioconductor_docker
HERE=`pwd`

## git clone rocker and bioc repo
git clone --depth 1 $ROCKER_REPO
git clone --depth 1 $BIOCONDUCTOR_REPO

###############################################
## 1. docker build rocker r-ver:devel repo

cd rocker-versioned/r-ver/

docker build -t rocker/r-ver:devel -f  devel.Dockerfile .

###############################################
## 2. docker build rocker rstudio:devel

cd $GITHUB_WORKSPACE; cd rocker-versioned/rstudio

echo "*** Building rocker/rstudio *** \n"

docker build -t rocker/rstudio:devel -f  devel.Dockerfile .

###############################################
## 3. docker build bioconductor_docker:devel

cd $GITHUB_WORKSPACE; cd bioconductor_docker
echo "*** Building bioconductor/bioconductor_docker *** \n"

## increment version number with awk
awk -F . '/^ARG /{$NF++; OFS="."} {print}'  Dockerfile > tmp && mv -f tmp Dockerfile

head Dockerfile

docker build -t nitesh1989/bioconductor_docker:devel .

docker login --username=$DOCKER_USERNAME --password=$DOCKER_PASSWORD

docker push nitesh1989/bioconductor_docker:devel

## Finish
echo "Done"
cd $HERE
