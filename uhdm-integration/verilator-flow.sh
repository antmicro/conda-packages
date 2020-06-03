#!/bin/bash

sed -i 's/"verilator_bin"/"uhdm-verilator_bin"/g' image/bin/verilator
sed -i 's/"verilator_bin_dbg"/"uhdm-verilator_bin_dbg"/g' image/bin/verilator

mkdir -p "$PREFIX/bin"
mkdir -p "$PREFIX/lib/surelog/sv"

cp "$SRC_DIR/image/lib/surelog/sv/builtin.sv" "$PREFIX/lib/surelog/sv/builtin.sv"
cp "$SRC_DIR/image/bin/surelog" "$PREFIX/bin/uhdm-surelog"
cp "$SRC_DIR/Surelog/build/dist/Release/hellosureworld" "$PREFIX/bin/uhdm-hellosureworld"
cp "$SRC_DIR/image/bin/verilator" "$PREFIX/bin/uhdm-verilator"
cp "$SRC_DIR/image/bin/verilator_bin" "$PREFIX/bin/uhdm-verilator_bin"
cp "$SRC_DIR/image/bin/verilator_bin_dbg" "$PREFIX/bin/uhdm-verilator_bin_dbg"
