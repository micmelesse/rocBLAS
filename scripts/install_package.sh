# install packages
dpkg -i ./package/rocblas-*ubuntu*.deb
dpkg -i ./package/rocblas-clients*.deb

cp -r /var/jenkins/workspace/Extended_rocBLAS_develop/*/rocblas/build/release/rocblas-install/rocblas/bin /opt/rocm/rocblas


