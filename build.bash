#!/usr/bin/env bash
set -eu

# TODO(fg) would be nice to not hard code this, but there is no "latest" tag
# and it's not clear how to discover the
# '6594e668feec68f102a58011bb42bd5dc07a7a9b' suffix, nor if the for-desktop-kernel
# stuff is gonna stick arround, so hard coding it is ...
# See https://github.com/docker/for-mac/issues/5295
KERNEL_VERSION=5.10.25-6594e668feec68f102a58011bb42bd5dc07a7a9b
KERNEL_IMAGE=docker/for-desktop-kernel:${KERNEL_VERSION}
REPO_NAME=felixge/devbox
RELEASE=1

docker build \
  --build-arg KERNEL_IMAGE=${KERNEL_IMAGE} \
  -t ${REPO_NAME}:${KERNEL_VERSION}-${RELEASE} \
  -t ${REPO_NAME}:latest \
  .

echo "Tagged as ${REPO_NAME}"
docker run \
  -it \
  --rm \
  --privileged \
  -v /etc/localtime:/etc/localtime:ro \
  -v `pwd`:/proftest \
  --pid=host \
  ${REPO_NAME}

  #-v /lib/modules:/lib/modules:ro \
