set -e

# install dependencies
apt update
apt -y install libomp-dev \
    gfortran \
    libboost-program-options-dev

# # install libbliss
# rm -rf blis
# wget -O blis.tar.gz https://github.com/amd/blis/releases/download/2.0/aocl-blis-mt-ubuntu-2.0.tar.gz
# tar -xvf blis.tar.gz
# mv amd-blis-mt blis
# rm blis.tar.gz
# ln -s blis/lib/libblis-mt.so blis/lib/libblis.so

# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/dockerx/rocBLAS/blis/lib # add blis to library path

# locate packages
PKG_DIR=rocblas_packages

# install packages
# dpkg -i $PKG_DIR/rocblas-2.*ubuntu*.deb
# dpkg -i $PKG_DIR/bert-mi60-tuned.deb
# dpkg -i rocblas_packages/rocblas-clients-2.15.0.1853-develop-20-eb4da81-Linux.deb
# dpkg -i rocblas_packages/rocblas-clients-2.19.0.2040-develop-18-a8a065b-ubuntu-16.04_amd64.deb
# dpkg -i rocblas_packages/rocblas-clients-2.21.0.2258-develop-37-a7a2fdd8-ubuntu-18.04_amd64.deb
dpkg -i rocblas_packages/rocblas-clients-2.19.0.2072-develop-28-6a1fc5a6-ubuntu-18.04_amd64.deb

# cp -r /var/jenkins/workspace/Extended_rocBLAS_develop/*/rocblas/build/release/rocblas-install/rocblas/bin /opt/rocm/rocblas
