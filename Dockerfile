FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -yq \
    cmake \
    curl \
    g++ \
    git \
    graphviz-dev \
    libcfitsio-dev \
    libfftw3-dev \
    libftgl-dev \
    libglew-dev \
    libglu1-mesa-dev \
    libgsl-dev \
    libjpeg-dev \
    libkrb5-dev \
    libldap2-dev \
    libmysqlclient-dev \
    libpcre3-dev \
    libpng-dev \
    libssl-dev \
    libtbb-dev \
    libx11-dev \
    libxext-dev \
    libxft-dev \
    libxi-dev \
    libxml2-dev \
    libxmu-dev \
    libxpm-dev \
    libxt-dev \
    make \
    python-dev \
    rsync \
    tcl \
    wget

RUN mkdir -p /opt \
 && curl -sL https://root.cern/download/root_v6.24.00.Linux-ubuntu20-x86_64-gcc9.3.tar.gz | tar -C /opt -zxf - \
 && curl -sL https://pythia.org/download/pythia83/pythia8305.tgz | tar -C /opt -zxf - \
 && cd /opt/pythia8305 \
 && ./configure --prefix=/opt/pythia \
 && make install \
 && cd - \
 && rm -rf /opt/pythia8305

ENV ROOTSYS=/opt/root
ENV PATH=$ROOTSYS/bin:$PATH
ENV PYTHONPATH=$ROOTSYS/lib:$PYTHONPATH
ENV LD_LIBRARY_PATH=$ROOTSYS/lib:$LD_LIBRARY_PATH
ENV PYTHIA8=/opt/pythia
ENV LD_LIBRARY_PATH=$PYTHIA8/lib:$LD_LIBRARY_PATH
