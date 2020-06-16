#!/bin/bash

mkdir -p "$PREFIX/bin"

sed -i 's/"verilator_bin"/"verilator_bin-uhdm"/g' image/bin/verilator
sed -i 's/"verilator_bin_dbg"/"verilator_bin_dbg-uhdm"/g' image/bin/verilator

cp "$SRC_DIR/image/bin/verilator" "$PREFIX/bin/verilator-uhdm"
cp "$SRC_DIR/image/bin/verilator_bin" "$PREFIX/bin/verilator_bin-uhdm"
cp "$SRC_DIR/image/bin/verilator_bin_dbg" "$PREFIX/bin/verilator_bin_dbg-uhdm"
