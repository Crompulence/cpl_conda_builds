FOAM_VERSION=3.0.1
FOAM_DIR_NAME=OpenFOAM-$FOAM_VERSION
source $CONDA_PREFIX/opt/$FOAM_DIR_NAME/etc/bashrc
cd $FOAM_LIBBIN/$FOAM_MPI
mv libPstream.so libPstream.so.orig
mv libPstream.so.cpl libPstream.so
echo "INFO:\n
	\tlibPstream.so has been replaced in OpenFOAM 3.0.1 It will be restored\n
	\tto the default when the app is uninstalled." >> $PREFIX/.messages.txt
