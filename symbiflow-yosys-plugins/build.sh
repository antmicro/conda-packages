#!/bin/bash

set -e
set -x

if [ x"$TRAVIS" = xtrue ]; then
	CPU_COUNT=2
fi

which pkg-config

echo "PREFIX := $PREFIX" >> Makefile.conf

make -C fasm-plugin install -j$CPU_COUNT
make -C xdc-plugin install -j$CPU_COUNT
make -C params-plugin install -j$CPU_COUNT
make -C selection-plugin install -j$CPU_COUNT
