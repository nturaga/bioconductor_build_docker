echo "Build bioconductor_docker image"

## Rocker repo
ROCKER_REPO=https://github.com/rocker-org/rocker-versioned

BIOCONDUCTOR_REPO=https://github.com/bioconductor/bioconductor_docker

HERE=`pwd`

echo $HERE

## git clone rocker and bioc repo
git clone --depth 1 $ROCKER_REPO

git clone --depth 1 $BIOCONDUCTOR_REPO

## docker build rocker repo

cd rocker-versioned/r-ver/

docker build -t rocker/r-ver:devel -f  devel.Dockerfile .

cd $GITHUB_WORKSPACE; cd rocker-versioned/rstudio

echo "*** Building rocker/rstudio *** \n"

docker build -t rocker/rstudio:devel -f  devel.Dockerfile .

cd $GITHUB_WORKSPACE; cd bioconductor_docker
echo "*** Building bioconductor/bioconductor_docker *** \n"

docker build -t nitesh1989/bioconductor_docker:devel .

docker login --username=$DOCKER_USERNAME --password=$DOCKER_PASSWORD

docker push nitesh1989/bioconductor_docker:devel

cd $HERE
