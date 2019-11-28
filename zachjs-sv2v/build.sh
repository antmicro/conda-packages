#! /bin/bash

set -e
set -x

make

mkdir -p $PREFIX/bin/
cp bin/sv2v $PREFIX/bin/zachjs-sv2v
