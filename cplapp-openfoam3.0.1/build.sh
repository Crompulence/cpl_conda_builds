FOAM_VERSION=3.0.1
FOAM_DIR_NAME=OpenFOAM-$FOAM_VERSION
echo "$PREFIX/opt" > CODE_INST_DIR
cp -Rf ${RECIPE_DIR}/linux64Gcc $PREFIX/opt/$FOAM_DIR_NAME/wmake/rules
source SOURCEME.sh
export CPL_LIBRARY_PATH=$PREFIX/lib
wmake libso src/CPLPstream
mv $FOAM_LIBBIN/$FOAM_MPI/libPstream.so $FOAM_LIBBIN/$FOAM_MPI/libPstream.so.orig
cp lib/libPstream.so $FOAM_LIBBIN/$FOAM_MPI
wmake libso src/CPLSocketFOAM
wmake src/solvers/CPLIcoFoam
mv $FOAM_LIBBIN/$FOAM_MPI/libPstream.so.orig $FOAM_LIBBIN/$FOAM_MPI/libPstream.so
mv lib/libPstream.so $FOAM_LIBBIN/$FOAM_MPI/libPstream.so.cpl
cp lib/* $PREFIX/lib
cp bin/* $PREFIX/bin
