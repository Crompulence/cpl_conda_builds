#!/usr/bin/env bash
FOAM_VERSION=3.0.1
FOAM_DIR_NAME=OpenFOAM-$FOAM_VERSION
source $CONDA_PREFIX/opt/$FOAM_DIR_NAME/etc/bashrc
LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$LD_LIBRARY_PATH
PSTREAM_DIR=$FOAM_LIBBIN/$FOAM_MPI
ls -l $PSTREAM_DIR
mv $PSTREAM_DIR/libPstream.so $PSTREAM_DIR/libPstream.so.orig
mv $PSTREAM_DIR/libPstream.so.cpl $PSTREAM_DIR/libPstream.so
py.test -v ./test
