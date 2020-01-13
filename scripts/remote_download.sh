#!/bin/bash
SCRIPTPATH=$(dirname $(realpath $0))

if [ ! "$BASH_VERSION" ]; then
    echo "Using bash instead of sh to run this script $0" 1>&2
    bash $SCRIPTPATH/remote_download.sh
    exit 1
fi

LOCAL_DUMP=~/Data/rocBLAS

REMOTE_PATH_LIST=(
    data/rocblas_log_bench_bert_512_hist_rbench_outpout.txt
)

for REMOTE_PATH in "${REMOTE_PATH_LIST[@]}"; do
    DOWNLOAD_DIR=${LOCAL_DUMP}/$(dirname $REMOTE_PATH)
    mkdir -p $DOWNLOAD_DIR
    rsync -av -e "ssh -p 20059" michael@10.216.64.100:~/dockerx/rocBLAS/$REMOTE_PATH ${DOWNLOAD_DIR}
    # rsync -av -e "ssh -p 20187" mmelesse@10.216.64.100:~/BERT/$REMOTE_PATH ${DOWNLOAD_DIR}
done
