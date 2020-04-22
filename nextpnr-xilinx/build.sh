#!/bin/bash

set -e
set -x

if [ x"$TRAVIS" = xtrue ]; then
	CPU_COUNT=2
fi

cmake -DARCH=xilinx -DBUILD_GUI=OFF -DCMAKE_INSTALL_PREFIX=${PREFIX} -DENABLE_READLINE=No .
make -j$(nproc)
make install

# List of devices available
DEVICES="xc7a35tcsg324-1"

SHARE_DIR=${PREFIX}/share/nextpnr-xilinx
mkdir -p $SHARE_DIR

# Compute data files for nextpnr-xilinx
for device in $DEVICES; do
    pypy3 xilinx/python/bbaexport.py --device $device --bba $SHARE_DIR/$device.bba
    ./bbasm $SHARE_DIR/$device.bba $SHARE_DIR/$device.bin -l
done
