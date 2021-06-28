DEBIAN_FRONTEND=noninteractive apt-get install -y \
  bison cmake flex g++ git libelf-dev zlib1g-dev libfl-dev systemtap-sdt-dev \
  binutils-dev llvm-7-dev llvm-7-runtime libclang-7-dev clang-7

git clone https://github.com/iovisor/bpftrace
mkdir bpftrace/build; cd bpftrace/build;
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j8
make install
