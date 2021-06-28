#!/usr/bin/env bash
set -eu

latest_version=$(curl https://golang.org/VERSION?m=text)
version=${1:-${latest_version}}

echo "Installing go ${version} ..."
wget https://golang.org/dl/${version}.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf ${version}.linux-amd64.tar.gz
echo 'export PATH="/usr/local/go/bin:${PATH}"' >> ~/.bashrc
