#!/bin/bash

# use bash
SCRIPT_PATH=$(realpath $0)
SCRIPT_DIR_PATH=$(dirname $SCRIPT_PATH)
if [ ! "$BASH_VERSION" ]; then
    echo "Using bash to run this script $0" 1>&2
    exec bash $SCRIPT_PATH "$@"
    exit 1
fi

# add data path
DATA_PATH=$(pwd)/data/rocblas_log_bench_bert_512_hist.csv
OUTPUT_PATH="${DATA_PATH%.*}_AMD_GFLOPS.txt"

# set flags
export HIP_VISIBLE_DEVICES=0 # choose gpu
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/dockerx/rocBLAS/blis/lib

# run rocblas-bench commands
cd /opt/rocm/rocblas/bin # switch to rocblas-bench directory
while IFS= read -r line; do
    FILTERED_LINE=$(echo $line | grep -oP "./rocblas-bench.*\d")
    source <(echo $FILTERED_LINE)
done <"$DATA_PATH" >"$OUTPUT_PATH"
