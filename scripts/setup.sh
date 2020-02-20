set -e

# install libomp
apt update
apt -y install libomp-dev

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
dpkg -i $PKG_DIR/rocblas-2.*ubuntu*.deb
dpkg -i $PKG_DIR/rocblas-clients*.deb

# cp -r /var/jenkins/workspace/Extended_rocBLAS_develop/*/rocblas/build/release/rocblas-install/rocblas/bin /opt/rocm/rocblas
