#!/bin/bash

set -e
set -x

if [ x"$TRAVIS" = xtrue ]; then
	CPU_COUNT=2
fi

DEVICES="artix7 kintex7 zynq7"
DBDIR="${PREFIX}/share/symbiflow/prjxray-db"

mkdir -p $DBDIR

for device in $DEVICES; do
    cp -r $device $DBDIR
done
