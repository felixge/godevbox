# start from bpftrace image which is currently based on ubuntu 20.04
FROM quay.io/iovisor/bpftrace:latest

WORKDIR /build
RUN apt-get update

# don't let tzdata and other package install interact with us
ENV DEBIAN_FRONTEND=noninteractive

# bpftrace doesn't work without kernel headers
ADD ./install_kernel_headers.bash .
RUN ./install_kernel_headers.bash

# utils to make local dev more pleasent
ADD ./install_utils.bash .
RUN ./install_utils.bash

# install go
ADD ./install_go.bash .
RUN ./install_go.bash 1.16.5

CMD mount -t debugfs debugfs /sys/kernel/debug && /bin/bash

WORKDIR /work
