echo "Hello Github actions"

## Rocker repo
ROCKER_REPO=https://github.com/rocker-org/rocker-versioned

## git clone rocker repo
git clone $ROCKER_REPO

## docker build rocker repo

cd rocker-versioned/r-ver/

docker build -t rocker/r-ver:devel -f  ${R_VER}/devel.Dockerfile .

