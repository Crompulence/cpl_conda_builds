FOAM_VERSION=3.0.1
FOAM_DIR_NAME=OpenFOAM-$FOAM_VERSION
CONDA_PYTHON=$(conda info --root)/bin/python
BUILD_MODE="download" # | "download"


if [ $BUILD_MODE == "download" ]; then
	${CONDA_PYTHON} ${RECIPE_DIR}/download-extra-sources.py
	cp ${RECIPE_DIR}/prefs.sh $SRC_DIR/etc
	export FOAM_INST_DIR=$(dirname $SRC_DIR)
else
	export FOAM_INST_DIR=$SRC_DIR
fi

foamDotFile=$FOAM_INST_DIR/$FOAM_DIR_NAME/etc/bashrc
echo $foamDotFile
if [ -f $foamDotFile ]; then
    source $foamDotFile
else
    echo "ERROR:"
    echo "   Configuration file 'OpenFOAM-$FOAM_VERSION/etc/bashrc' not found."
    return 1
fi

# Only build if the sources are downloaded
if [ $BUILD_MODE == "download" ]; then
	cd $SRC_DIR/../ThirdParty-3.0.1
	./Allwmake -j
	cd $SRC_DIR
	./Allwmake -j
fi

# Patch bashrc to allow proper sourcing as in 4.0
cd $FOAM_INST_DIR/$FOAM_DIR_NAME
pwd
patch -p0 < $RECIPE_DIR/bashrc.patch

# -- INSTALL --
#Scotch and Ptscotch libraries compiled with mpi-system version of MPI
cp $FOAM_EXT_LIBBIN/mpi-system/* $PREFIX/lib

# Copy the whole directory structure to /opt except:
# - $FOAM_LIBBIN/../applications
# - $FOAM_LIBBIN/../src
mkdir $PREFIX/opt
cp -R $FOAM_INST_DIR/$FOAM_DIR_NAME $PREFIX/opt