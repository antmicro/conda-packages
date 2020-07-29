#!/bin/bash

set -e
set -x

if [ x"$TRAVIS" = xtrue ]; then
	CPU_COUNT=2
fi

#unset CFLAGS
#unset CXXFLAGS
#unset CPPFLAGS
#unset DEBUG_CXXFLAGS
#unset DEBUG_CPPFLAGS
#unset LDFLAGS

which pkg-config

cd yosys

make V=1 -j$CPU_COUNT
cp yosys "$PREFIX/bin/antmicro-yosys"

$PREFIX/bin/antmicro-yosys -V
