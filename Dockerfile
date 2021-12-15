FROM ubuntu:20.10
RUN apt update && \
	DEBIAN_FRONTEND=noninteractive apt install -y cmake git python3 \
	ninja-build wget pkg-config

ARG ABI

ADD arm-openipc-${ABI}_sdk-buildroot.tar.gz /opt
ADD arm-openipc-${ABI}.cmake /opt/arm-openipc.cmake
RUN ln -sv /opt/arm-openipc-linux-* /opt/arm-openipc
ADD bufferevent_ssl.h /tmp/bufferevent_ssl.h
RUN mv /tmp/bufferevent_ssl.h /opt/arm-openipc/arm-openipc-*/sysroot/usr/include/event2
ENV PATH /opt/arm-openipc/bin:$PATH
