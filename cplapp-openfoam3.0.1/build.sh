FOAM_VERSION=3.0.1
FOAM_DIR_NAME=OpenFOAM-$FOAM_VERSION
echo "$PREFIX/opt" > CODE_INST_DIR
source SOURCEME.sh
export LIBRARY_PATH=$LIBRARY_PATH:$PREFIX/lib
make
mv lib/libPstream.so $FOAM_LIBBIN/$FOAM_MPI/libPstream.so.cpl
cp lib/* $PREFIX/lib
cp bin/* $PREFIX/bin
