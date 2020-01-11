export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/dockerx/rocBLAS/blis/lib

# ROCBLAS_BENCH=/var/jenkins/workspace/Extended_rocBLAS_develop/*/rocblas/build/release/rocblas-install/rocblas/bin/rocblas-bench
ROCBLAS_BENCH=/opt/rocm/rocblas/bin/rocblas-bench

$ROCBLAS_BENCH -f gemm -r f32_r --transposeA N --transposeB N -m 1024 -n 2048 -k 1024 --alpha 1 --lda 1024 --ldb 1024 --beta 0 --ldc 1024
