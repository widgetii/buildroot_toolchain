#!/usr/bin/env bash

set -x

ABI=$1

case $ABI in
  linux-musleabi) true ;;
  linux-uclibcgnueabihf) true ;;
  *) echo "Usage: $0 <ABI>"; exit 1 ;;
esac

SDKFILE=arm-openipc-${ABI}_sdk-buildroot.tar.gz
if [ ! -f "$SDKFILE" ]; then
    echo "$SDKFILE does not exist. Maybe you need to rename it after download"
    exit 2
fi

TAG=$(date -u +"%y%m%d")
IMAGE="openipc/buildroot_${ABI}_toolchain:$TAG"
docker \
  build \
  --build-arg ABI=$ABI \
  -t $IMAGE .

echo "Built $IMAGE"
