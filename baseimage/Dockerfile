FROM ubuntu:${UBUNTU_VERSION}
RUN (apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential ocaml automake autoconf \
    libtool wget python libssl-dev libcurl4-openssl-dev protobuf-compiler libprotobuf-dev \
    cmake kmod)