set -e

# install dependencies
apt update
apt -y install libomp-dev \
    gfortran \
    libboost-program-options-dev \
    wget \
    unzip \

# setup dir
# rm -rf rocblas_package_latest
mkdir -p rocblas_package_latest
cd rocblas_package_latest

#download and unzip packages
wget -nc http://math-ci.rocm.amd.com/job/rocm-docker/job/extended/job/rocBLAS/job/develop/lastSuccessfulBuild/
unzip -n package.zip


# # install packages
# PKG_DIR=package
# dpkg -i $PKG_DIR/rocblas-*ubuntu-18.04*.deb