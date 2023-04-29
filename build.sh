#!/usr/bin/env bash

set -x

ABI=$1

ARCH=$2
[ -z "$ARCH" ] && ARCH=arm

case $ABI in
  fh8852v200-linux-musleabi) true ;;
  gm8136-linux-uclibcgnueabi) true ;;
  hi3516cv100-linux-musleabi)
    SDKFILE=arm-gcc8.4.0-musl-3_0-1e913a17.tgz
    ;;
  hi3516cv200-linux-musleabi)
    SDKFILE=arm926t-gcc8.4.0-musl-4_9-1e913a17.tgz
    ;;
  hi3516cv300-linux-musleabi)
    SDKFILE=arm926t-gcc8.4.0-musl-3_18-1e913a17.tgz
    ;;
  hi3516cv500-linux-gnueabi)
    SDKFILE=cortex_a7-gcc12.1.0-glibc-4_9-c2ce36fd.tgz
    ;;
  hi3516ev200-linux-musleabi)
    SDKFILE=cortex_a7_thumb2-gcc8.4.0-musl-4_9-1e913a17.tgz
    ;;
  hi3519v101-linux-musleabi)
    SDKFILE=cortex_a17_a7_thumb2-gcc8.4.0-musl-3_18-1e913a17.tgz
    ;;
  nt98562-linux-musleabihf) true ;;
  infinity6b0-linux-musleabihf)
    SDKFILE=cortex_a7_thumb2_hf-gcc8.4.0-musl-4_9-1e913a17.tgz
    ;;
  infinity6e-linux-gnueabi)
    SDKFILE=cortex_a7_thumb2_hf-gcc12.2.0-glibc-4_9-71f114d2.tgz
    ;;
  t31-linux-musl)
    ARCH=mipsel
    SDKFILE=mips_xburst-gcc8.4.0-musl-3_10-1e913a17.tgz
    ;;
  t40-linux-musl)
    ARCH=mipsel
    SDKFILE=mips_xburst-gcc8.4.0-musl-4_4-1e913a17.tgz
    ;;
  xm5[13]0-linux-musleabi) true ;;
  *) echo "Usage: $0 <ABI>"; exit 1 ;;
esac

SDKFILE=${SDKFILE:=${ARCH}-openipc-${ABI}_sdk-buildroot.tar.gz}
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
  --build-arg SDKFILE=$SDKFILE \
  -t $IMAGE .

echo "Built $IMAGE"
