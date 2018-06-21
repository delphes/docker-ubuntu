FROM ubuntu:18.04

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
    libqt4-dev \
    libqt4-opengl-dev \
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
 && curl -sL https://root.cern.ch/download/root_v6.14.00.Linux-ubuntu18-x86_64-gcc7.3.tar.gz | tar -C /opt -zxf - \
 && curl -sL http://home.thep.lu.se/~torbjorn/pythia8/pythia8235.tgz | tar -C /opt -zxf - \
 && cd /opt/pythia8235 \
 && ./configure --prefix=/opt/pythia \
 && make install \
 && cd - \
 && rm -rf /opt/pythia8235

ENV ROOTSYS=/opt/root
ENV PATH=$ROOTSYS/bin:$PATH
ENV PYTHONPATH=$ROOTSYS/lib:$PYTHONPATH
ENV LD_LIBRARY_PATH=$ROOTSYS/lib:$LD_LIBRARY_PATH
ENV PYTHIA8=/opt/pythia
