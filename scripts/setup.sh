# locate packages
PKG_DIR=rocblas_packages

# install packages
dpkg -i $PKG_DIR/rocblas-*ubuntu*.deb
dpkg -i $PKG_DIR/rocblas-clients*.deb
cp -r /var/jenkins/workspace/Extended_rocBLAS_develop/*/rocblas/build/release/rocblas-install/rocblas/bin /opt/rocm/rocblas

# install libbliss
rm -rf blis
wget -O blis.tar.gz https://github.com/amd/blis/releases/download/2.0/aocl-blis-mt-ubuntu-2.0.tar.gz
tar -xvf blis.tar.gz
mv amd-blis-mt blis
rm blis.tar.gz
cd blis/lib
ln -s libblis-mt.so libblis.so
cd ../..

# install dep libomp
apt update
apt -y install libomp-dev
