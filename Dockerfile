FROM ubuntu:20.10
RUN apt update && \
	DEBIAN_FRONTEND=noninteractive apt install -y cmake git python3 \
	ninja-build wget pkg-config

ARG ABI
ARG ARCH

ADD ${ARCH}-openipc-${ABI}_sdk-buildroot.tar.gz /opt
ADD ${ARCH}-openipc-${ABI}.cmake /opt/${ARCH}-openipc.cmake
RUN ln -sv /opt/${ARCH}-openipc-linux-* /opt/${ARCH}-openipc
ENV PATH /opt/${ARCH}-openipc/bin:$PATH
