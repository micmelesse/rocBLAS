#!/bin/bash

# use bash
SCRIPT_PATH=$(realpath $0)
if [ ! "$BASH_VERSION" ]; then
    echo "Using bash to run this script $0" 1>&2
    exec bash $SCRIPT_PATH "$@"
    exit 1
fi

export HIP_VISIBLE_DEVICES=0 # choose gpu
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/dockerx/rocBLAS/blis/lib
DATA_DIR=$(pwd)/data

cd /opt/rocm/rocblas/bin # switch to rocblas-bench directory
while IFS= read -r line; do
    FILTERED_LINE=$(echo $line | grep -oP "./rocblas-bench.*\d")
    source <(echo $FILTERED_LINE)
done <"$DATA_DIR/rocblas_log_bench_bert_512_hist.csv" >"$DATA_DIR/rocblas_log_bench_bert_512_hist_rbench_output.txt"
