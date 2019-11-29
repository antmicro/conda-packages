#!/bin/bash

set -x
set -e

CONDA_PATH=${1:-~/conda}

echo "Downloading Conda installer."
if [ $TRAVIS_OS_NAME = 'windows' ]; then
    if [ ! -d $CONDA_PATH -o ! -z "$CI"  ]; then
        wget -c https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe -o miniconda.exe
        echo "Installing conda"
        cmd.exe /c 'miniconda.exe /S /D=${CONDA_PATH}'
    fi
    alias conda='powershell $CONDA_PATH/condabin/conda'
else
    if [ $TRAVIS_OS_NAME = 'linux' ]; then
        sys_name=Linux
    else
        sys_name=MacOSX
    fi

    wget -c https://repo.continuum.io/miniconda/Miniconda3-latest-${sys_name}-x86_64.sh
    chmod a+x Miniconda3-latest-${sys_name}-x86_64.sh
    if [ ! -d $CONDA_PATH -o ! -z "$CI"  ]; then
            echo "Installing conda"
            ./Miniconda3-latest-${sys_name}-x86_64.sh -p $CONDA_PATH -b -f
    fi
fi

export PATH=$CONDA_PATH/bin:$PATH

# Updating conda
conda update -y conda setuptools
if [ $TRAVIS_OS_NAME = 'windows' ]; then
    conda install -y conda-build anaconda-client jinja2 conda-verify
else
    conda install -y conda-build anaconda-client jinja2 conda-verify ripgrep
fi
