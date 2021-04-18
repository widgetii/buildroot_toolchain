FROM ubuntu:20.10
RUN apt update && \
	DEBIAN_FRONTEND=noninteractive apt install -y cmake git python3 \
	ninja-build wget pkg-config

ADD arm-openipc-linux-musleabi_sdk-buildroot.tar.gz /opt
ADD arm-openipc-linux-musleabi.cmake /opt
ENV PATH /opt/arm-openipc-linux-musleabi_sdk-buildroot/bin:$PATH
