#!/bin/sh

mkdir build
cd build

cmake .. -G"Unix Makefiles" -DCMAKE_INSTALL_PREFIX="${PREFIX}"
make -j${CPU_COUNT}
make install
