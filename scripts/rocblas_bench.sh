#!/bin/bash

# use bash
SCRIPT_PATH=$(realpath $0)
SCRIPT_DIR_PATH=$(dirname $SCRIPT_PATH)
if [ ! "$BASH_VERSION" ]; then
    echo "Using bash to run this script $0" 1>&2
    exec bash $SCRIPT_PATH "$@"
    exit 1
fi

# set flags
export HIP_VISIBLE_DEVICES=0                                      # choose gpu
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/dockerx/rocBLAS/blis/lib # add blis to library path

# add data path
# DATA_PATH=$(pwd)/data/rocblas_log_bench_bert_512_hist.csv
# DATA_PATH=$(pwd)/data/new_gemm_list.csv
# DATA_PATH=$(pwd)/data/rocblas_log_bench_ba1_seq512_count.csv
# DATA_PATH=$(pwd)/data/rocblas_log_bench_ba4_seq512_count.csv
# DATA_PATH=$(pwd)/data/rocblas_log_bench_ba5_seq512_count.csv
# DATA_PATH=$(pwd)/data/rocblas_log_bench_ba6_seq512_count.csv
# DATA_PATH=$(pwd)/data/rocblas_log_bench_ba8_seq128_count.csv
# DATA_PATH=$(pwd)/data/rocblas_log_bench_ba9_seq128_count.csv
# DATA_PATH=$(pwd)/data/rocblas_log_bench_ba10_seq128_count.csv
# DATA_PATH=$(pwd)/data/rocblas_log_bench_ba39_seq128_count.csv
# DATA_PATH=$(pwd)/data/rocblas_log_bench_ba40_seq128_count.csv
# DATA_PATH=$(pwd)/data/rocblas_log_bench_ba41_seq128_count.csv


# run rocblas-bench commands
cd /opt/rocm/rocblas/bin # switch to rocblas-bench directory

# execute rocblas commands
for i in 1; do
    OUTPUT_PATH="${DATA_PATH%.*}_AMD_GFLOPS_$i.txt"
    while IFS= read -r line; do
        FILTERED_LINE=$(echo $line | grep -oP "./rocblas-bench.*\d")
        if [ ! -z "$FILTERED_LINE" ]; then
            source <(echo $FILTERED_LINE --iters 1000)
        fi
    done <"$DATA_PATH" >"$OUTPUT_PATH"
done
