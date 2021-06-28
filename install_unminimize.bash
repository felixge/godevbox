#!/usr/bin/env bash
set -eu

echo "-> Unminimizing docker image ..."
apt-get -y install man-db
yes | unminimize
