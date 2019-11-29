#! /bin/bash

set -e
set -x
uname_out="$(uname)"
if [ ${uname_out} = "Linux" ]; then
    export CC=gcc-${USE_SYSTEM_GCC_VERSION}
    export CXX=g++-${USE_SYSTEM_GCC_VERSION}
    sys_name=linux
elif [ ${uname_out} = "Darwin" ]; then
    sys_name=darwin
    export CC=clang
    export CXX=clang++
fi

mkdir bazel-install
BAZEL_PREFIX=$PWD/bazel-install

wget https://github.com/bazelbuild/bazel/releases/download/1.2.1/bazel-1.2.1-installer-${sys_name}-x86_64.sh
chmod +x bazel-1.2.1-installer-${sys_name}-x86_64.sh
./bazel-1.2.1-installer-${sys_name}-x86_64.sh --prefix=$BAZEL_PREFIX

export PATH=$BAZEL_PREFIX/bin:$PATH

bazel build --cxxopt='-std=c++17' //...

mkdir -p $PREFIX/bin/
cp bazel-bin/verilog/tools/syntax/verilog_syntax $PREFIX/bin/verilog_syntax
