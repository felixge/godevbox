# Start with the excellent ebpf-tracer image for getting ebpf, bcc, and
# other linux tools.
# https://gitlab.sandstorm.de/public-containers/ebpf-tracer
FROM docker-hub.sandstorm.de/public-containers/ebpf-tracer:latest

WORKDIR /build
RUN apt-get update

# don't let tzdata and other package install interact with us
ENV DEBIAN_FRONTEND=noninteractive

# make sure we got man pages and stuff
ADD ./install_unminimize.bash .
RUN ./install_unminimize.bash

# various utils to make local dev more pleasent
ADD ./install_utils.bash .
RUN ./install_utils.bash

# install linux perf
ADD ./install_perf.bash .
RUN ./install_perf.bash

# install go
ADD ./install_go.bash .
RUN ./install_go.bash # you can pass go version here if you want, e.g. go1.16.5

ADD ./command.bash .
CMD ["/build/command.bash"]

# set working directory
WORKDIR /work
