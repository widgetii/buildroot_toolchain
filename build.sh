#!/usr/bin/env bash

TAG=$(date -u +"%y%m%d")
IMAGE="openipc/buildroot_toolchain:$TAG"
docker \
  build -t $IMAGE .

echo "Built $IMAGE"
