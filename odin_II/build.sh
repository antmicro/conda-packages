#!/bin/bash

set -e
set -x

if [ x"$TRAVIS" = xtrue ]; then
	CPU_COUNT=2
fi

cd ODIN_II
make build -j$CPU_COUNT

mkdir -p $PREFIX/bin/
cp odin_II $PREFIX/bin/odin_II
