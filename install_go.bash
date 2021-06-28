#!/usr/bin/env bash
set -eu

version=$1

wget https://golang.org/dl/go${version}.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go${version}.linux-amd64.tar.gz

echo 'export PATH="/usr/local/go/bin:${PATH}"' >> ~/.bashrc
