FOAM_VERSION=3.0.1
FOAM_DIR_NAME=OpenFOAM-$FOAM_VERSION
source $CONDA_PREFIX/opt/$FOAM_DIR_NAME/etc/bashrc
cd $FOAM_LIBBIN/$FOAM_MPI
mv libPstream.so libPstream.so.cpl
mv libPstream.so.orig libPstream.so
echo "INFO:\n
	\tlibPstream.so has been restored to the default in OpenFOAM 3.0.1." >> $PREFIX/.messages.txt
