FROM ubuntu:22.04

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
    python3-dev \
    rsync \
    tcl \
    wget

RUN mkdir -p /opt \
 && curl -sL https://root.cern/download/root_v6.28.06.Linux-ubuntu22-x86_64-gcc11.4.tar.gz | tar -C /opt -zxf - \
 && curl -sL https://pythia.org/download/pythia83/pythia8310.tgz | tar -C /opt -zxf - \
 && cd /opt/pythia8310 \
 && ./configure --prefix=/opt/pythia \
 && make install \
 && cd - \
 && rm -rf /opt/pythia8310

ENV ROOTSYS=/opt/root
ENV PATH=$ROOTSYS/bin:$PATH
ENV PYTHONPATH=$ROOTSYS/lib:$PYTHONPATH
ENV LD_LIBRARY_PATH=$ROOTSYS/lib:$LD_LIBRARY_PATH
ENV PYTHIA8=/opt/pythia
ENV LD_LIBRARY_PATH=$PYTHIA8/lib:$LD_LIBRARY_PATH
