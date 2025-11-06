#!/bin/bash

root_path=$(pwd)
mkdir -p build/debug
cmake -B build/debug \
      -DONVEY_DEBUG=ON \
      -DONVEY_FMTLIB_INCLUDE_DIR="${root_path}/third-party/build/include" \
      -DONVEY_EXTRA_LINKER_FLAGS="-L${root_path}/third-party/build/lib"

cmake --build build/debug
