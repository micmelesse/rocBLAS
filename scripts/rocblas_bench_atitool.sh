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
DATA_PATH="$(pwd)/data/DPM=4 MI60 BERT_sorted_bench_commands.csv"

# run rocblas-bench commands
cd /opt/rocm/rocblas/bin # switch to rocblas-bench directory

# execute rocblas commands
for i in 1; do
    OUTPUT_PATH="${DATA_PATH%.*}_AMD_GFLOPS_$i.txt"
    while IFS= read -r line; do
        FILTERED_LINE=$(echo $line | grep -oP "./rocblas-bench.*\d")
        echo $FILTERED_LINE
        if [ ! -z "$FILTERED_LINE" ]; then
            source <(echo $FILTERED_LINE --iters 50000)
            read -p "Press any key to continue" input </dev/tty 
        fi
        
    done <"$DATA_PATH" >"$OUTPUT_PATH"
done