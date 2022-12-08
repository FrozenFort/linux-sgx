#!/bin/sh

UBUNTU_VERSION=$1
BASEIMAGE_NAME="ubuntu-builder"
if [[ "$UBUNTU_VERSION" != "20.04" ]]; then
    UBUNTU_VERSION="16.04"
fi

SDK_IMAGE=ubuntu$UBUNTU_VERSION-sgx-sdk
SDK_TAG=1.9

ret=$(docker images -q $BASEIMAGE_NAME:$UBUNTU_VERSION 2> /dev/null)
if [[ "$ret" == "" ]]; then
    echo "Base image for ubuntu$UBUNTU_VERSION does not exist."
    echo "Build $BASEIMAGE_NAME:$UBUNTU_VERSION ..."
    docker build -f ./baseimage/ubuntu-$UBUNTU_VERSION/Dockerfile \
        --build-arg ARG_VERSION=$UBUNTU_VERSION \
        -t $BASEIMAGE_NAME:$UBUNTU_VERSION .
fi

echo "Build $SDK_IMAGE:$SDK_TAG ..."
docker build -f ./Dockerfile \
    --build-arg ARG_VERSION=$UBUNTU_VERSION \
    -t $SDK_IMAGE:$SDK_TAG .
