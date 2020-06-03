#!/bin/bash

mkdir -p "$PREFIX/bin"
mkdir -p "$PREFIX/lib/surelog/sv"

cp "$SRC_DIR/image/lib/surelog/sv/builtin.sv" "$PREFIX/lib/surelog/sv/builtin.sv"
cp "$SRC_DIR/image/bin/surelog" "$PREFIX/bin/uhdm-surelog"
cp "$SRC_DIR/Surelog/build/dist/Release/hellosureworld" "$PREFIX/bin/uhdm-hellosureworld"
cp "$SRC_DIR/yosys/yosys" "$PREFIX/bin/uhdm-yosys"
