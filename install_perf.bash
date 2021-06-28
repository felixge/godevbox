#!/usr/bin/env bash
set -eu

echo "Installing linux perf ..."
apt-get -y install linux-tools-generic

# the default /usr/bin/perf is a bash script that fails to find the
# linux-tools-generic install from above, so let's try to fix that.
# WARNING: Not sure if this is a bad idea :)
ln -fs $(find /usr/lib -maxdepth 2 -name perf) /usr/bin/perf
