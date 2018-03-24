#!/bin/sh
CONDA_DIR=$(dirname $(dirname $(which conda)))
echo $CONDA_DIR
conda clean --all --yes
conda build purge
rm -rf $CONDA_DIR/conda-bld/*
rm -rf $CONDA_DIR/pkgs/*
