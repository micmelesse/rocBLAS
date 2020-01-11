PKG_DIR=rocblas_packages
rm -rf $PKG_DIR
mkdir -p $PKG_DIR
cd $PKG_DIR
wget http://10.216.151.18:8080/job/Extended/job/rocBLAS/job/develop/lastSuccessfulBuild/artifact/kTK0aGD8N/rocblas/build/release/package/rocblas-2.15.0.1853-develop-20-eb4da81-ubuntu-16.04_amd64.deb
wget http://10.216.151.18:8080/job/Extended/job/rocBLAS/job/develop/lastSuccessfulBuild/artifact/kTK0aGD8N/rocblas/build/release/package/rocblas-clients-2.15.0.1853-develop-20-eb4da81-Linux.deb
cd ..
