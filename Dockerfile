FROM ubuntu:20.10
RUN apt update && \
	DEBIAN_FRONTEND=noninteractive apt install -y cmake git python3 \
	ninja-build wget pkg-config

ARG ABI

ADD arm-openipc-${ABI}_sdk-buildroot.tar.gz /opt
ADD arm-openipc-${ABI}.cmake /opt
ENV PATH /opt/arm-openipc-${ABI}_sdk-buildroot/bin:$PATH
