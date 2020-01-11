clear
PWD=`pwd`
DOCKER_DIR=/`basename $PWD`
TRAIN_DIR=$DOCKER_DIR/bert_toy_train_rocblas_trace
ROCBLAS_COMMANDS_DIR=$TRAIN_DIR/test_en_ba32_seq128
# ROCBLAS_COMMANDS_DIR=$TRAIN_DIR/test_en_ba16_seq256
# ROCBLAS_COMMANDS_DIR=$TRAIN_DIR/test_en_ba64_seq64
CONFIG_NAME=`basename $ROCBLAS_COMMANDS_DIR`


docker run -it -v $PWD:$DOCKER_DIR -w $DOCKER_DIR \
    --network=host \
    --device=/dev/kfd \
    --device=/dev/dri \
    --group-add video \
    --cap-add=SYS_PTRACE \
    --security-opt seccomp=unconfined \
    rocm/tensorflow-private:rocm2.4-tf1.14-rocblas-bench bash scripts/rocblas_bench.sh $ROCBLAS_COMMANDS_DIR/${CONFIG_NAME}_ROCBLAS_LOG_BENCH_unique.csv $ROCBLAS_COMMANDS_DIR/${CONFIG_NAME}_rocblas_bench_output.txt

docker run -it -v $PWD:$DOCKER_DIR -w $DOCKER_DIR \
    --network=host \
    --device=/dev/kfd \
    --device=/dev/dri \
    --group-add video \
    --cap-add=SYS_PTRACE \
    --security-opt seccomp=unconfined \
    rocm/tensorflow-private:rocm2.4-tf1.14-rocblas-bench bash scripts/rocblas_bench.sh $TRAIN_DIR/ROCBLAS_LOG_BENCH_unique.csv $TRAIN_DIR/rocblas_bench_output.txt

