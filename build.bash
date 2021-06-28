#!/usr/bin/env bash
set -eu

REPO_NAME=felixge/devbox
RELEASE=1

docker build -t ${REPO_NAME}:latest .

echo "Tagged as ${REPO_NAME}"

docker run \
  --rm \
  --privileged \
  -it \
  -v /lib/modules:/lib/modules:ro \
  -v /etc/localtime:/etc/localtime:ro \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --pid=host \
  ${REPO_NAME}
