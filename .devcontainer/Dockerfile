
FROM ubuntu:24.04

WORKDIR /workspace/cpp

RUN apt update && apt install -y \
    build-essential \
    g++ \
    cmake \
    bear \
    gdb \
    subversion \
    # CompuTree dependencies
    qtbase5-dev \
    qt5-qmake \
    qtcreator \
    libeigen3-dev \
    libmuparser-dev \
    libgdal-dev gdal-bin \
    libopencv-dev python3-opencv \
    libpcl-dev \
    libboost-all-dev \
    libgsl-dev gsl-bin \
    libqhull-dev \
    libflann-dev \
    liblaszip-dev
