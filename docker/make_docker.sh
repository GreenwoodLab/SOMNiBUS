THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export THISDIR
export PROJECTROOT=$THISDIR/../
export DOCKER_BUILDKIT=1
IMAGE="somnibus"
VERSION="4.0.2"
echo "THISDIR: " $THISDIR
echo "PROJECTROOT: " $PROJECTROOT
echo "GOING TO BUILD $IMAGE:$VERSION"
docker build $PROJECTROOT --file Dockerfile -t $IMAGE:$VERSION
echo "$IMAGE:$VERSION BUILDED"
docker tag $IMAGE:$VERSION happyregistry.azurecr.io/methods/wes/$IMAGE:$VERSION
echo "GOING TO PUSH $IMAGE:$VERSION"
docker push happyregistry.azurecr.io/methods/wes/$IMAGE:$VERSION
echo "$IMAGE:$VERSION PUSHED"
