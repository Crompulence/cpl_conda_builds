FOAM_VERSION=3.0.1
FOAM_DIR_NAME=OpenFOAM-$FOAM_VERSION
source $CONDA_PREFIX/opt/$FOAM_DIR_NAME/etc/bashrc
cd $FOAM_MPI_LIBBIN
mv libPstream.so libPstream.so.orig
mv $CONDA_PREFIX/lib/libPstream.so .
echo "INFO: libPstream.so has been replaced in OpenFOAM." >> $PREFIX/.messages.txt
