sh scripts/install_package.sh
sh scripts/install_bliss.sh
apt update
apt install libomp-dev
sh scripts/rocblas_bench.sh
