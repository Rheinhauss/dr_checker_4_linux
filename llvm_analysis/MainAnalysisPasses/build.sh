#!/bin/bash
LLVM_DIR=$LLVM_ROOT/../cmake
echo "[*] Trying to Run Cmake"
rm build_dir
mkdir build_dir
cd build_dir
cmake ..
echo "[*] Trying to make"
make -j8
