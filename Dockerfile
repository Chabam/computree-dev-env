FROM fedora:latest AS dependencies
RUN dnf update -y && dnf install -y \
    subversion \
    qt5-qtbase-devel \
    eigen3-devel \
    gdal-devel \
    muParser-devel \
    opencv-devel \
    pcl-devel \
    boost-devel \
    gsl-devel \
    qhull-devel \
    flann-devel \
    laszip-devel

FROM dependencies AS qmake_gen
COPY . /computree
WORKDIR /computree/computreev6
RUN cd ./config/revision/ && ./rev.sh && cd -
RUN qmake-qt5 ./computree.pro
RUN ./create_plugins_pro.sh

FROM qmake_gen AS build_computree
RUN make -j$(nproc)

FROM scratch
COPY --from=build_computree /computree/ComputreeInstallRelease /
ENTRYPOINT ["/ComputreeInstallRelease"]
