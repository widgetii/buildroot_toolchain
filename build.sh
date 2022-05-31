#!/usr/bin/env bash

set -x

ABI=$1

ARCH=$2
[ -z "$ARCH" ] && ARCH=arm

case $ABI in
  t31-linux-musl) ARCH=mipsel ;;
  hi3516av100-linux-musleabi) true ;;
  hi3516cv[123]00-linux-musleabi) true ;;
  hi3516cv500-linux-gnueabi) true ;;
  hi3516ev300-linux-musleabi) true ;;
  hi3519v101-linux-musleabi) true ;;
  nt98562-linux-musleabihf) true ;;
  ssc335-linux-musleabihf) true ;;
  xm5[13]0-linux-musleabi) true ;;
  *) echo "Usage: $0 <ABI>"; exit 1 ;;
esac

SDKFILE=${ARCH}-openipc-${ABI}_sdk-buildroot.tar.gz
if [ ! -f "$SDKFILE" ]; then
    echo "$SDKFILE does not exist. Maybe you need to rename it after download"
    exit 2
fi

TAG=$(date -u +"%y%m%d")
IMAGE="ghcr.io/widgetii/buildroot_${ABI}_toolchain:$TAG"
docker \
  build \
  --build-arg ABI=$ABI \
  --build-arg ARCH=$ARCH \
  -t $IMAGE .

echo "Built $IMAGE"
