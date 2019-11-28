#!/bin/bash

set -e
set -x

if [ x"$TRAVIS" = xtrue ]; then
	CPU_COUNT=2
fi

curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env

cargo build --example parse_sv --release

mkdir -p $PREFIX/bin/
cp target/release/examples/parse_sv $PREFIX/bin/parse_sv

$PREFIX/bin/parse_sv --version
