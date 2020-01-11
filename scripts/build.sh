#!/bin/bash
SCRIPT_PATH=$(realpath $0)

# use bash
if [ ! "$BASH_VERSION" ]; then
    echo "Using bash to run this script $0" 1>&2
    exec bash $SCRIPT_PATH "$@"
    exit 1
fi

# remove previous build
rm -rf build

if [[ "$*" == *"custom"* ]]; then
    # after downloading and changing to rocblas directory:
    mkdir -p build/release

    cd build/release

    # Default install location is in /opt/rocm, use -DCMAKE_INSTALL_PREFIX=<path> to specify other
    CXX=/opt/rocm/bin/hcc cmake -DBUILD_CLIENTS_TESTS=ON -DBUILD_CLIENTS_BENCHMARKS=ON -DBUILD_CLIENTS_SAMPLES=ON ../..
    make -j$(nproc)
    make install # sudo required if installing into sys

else
    ./install.sh -d \
        2>&1 | tee log.txt
fi
