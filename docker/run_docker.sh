
THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export THISDIR
export PROJECTROOT=$THISDIR/../
IMAGE="happyregistry.azurecr.io/methods/wes/somnibus"
VERSION="4.0.2"
docker pull $IMAGE:$VERSION
docker run --rm -e DISABLE_AUTH=true -p 8787:8787 -v $PROJECTROOT:/home/rstudio/somnibus $IMAGE:$VERSION
#docker run --rm -e ROOT=TRUE -e PASSWORD=1234 -p 8787:8787 -v $PROJECTROOT:/home/rstudio/somnibus $IMAGE:$VERSION
