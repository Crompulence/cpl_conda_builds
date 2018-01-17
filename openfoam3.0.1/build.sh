FOAM_VERSION=3.0.1
FOAM_DIR_NAME=OpenFOAM-$FOAM_VERSION
FOAM_SRC_DIR=$SRC_DIR/$FOAM_DIR_NAME
CONDA_PYTHON=$(conda info --root)/bin/python
BUILD_MODE="download"


if [ $BUILD_MODE == "download" ]; then
	${CONDA_PYTHON} ${RECIPE_DIR}/download-extra-sources.py
	cp ${RECIPE_DIR}/prefs.sh $FOAM_SRC_DIR/etc
	cp ${RECIPE_DIR}/prefs.csh $FOAM_SRC_DIR/etc
	# Move the third party directory as openfoam expects it in the same folder
        mv $SRC_DIR/../ThirdParty-$FOAM_VERSION $SRC_DIR	
fi

export FOAM_INST_DIR=$SRC_DIR
# Add custom compiler options
cp -Rf ${RECIPE_DIR}/linux64Gcc $FOAM_SRC_DIR/wmake/rules
cp -f ${RECIPE_DIR}/Makefile.inc.i686_pc_linux2.shlib-OpenFOAM-64Int32 $SRC_DIR/ThirdParty-$FOAM_VERSION/etc/wmakeFiles/scotch
foamDotFile=$FOAM_SRC_DIR/etc/bashrc
echo $foamDotFile
if [ -f $foamDotFile ]; then
    source $foamDotFile
else
    echo "ERROR:"
    echo "   Configuration file 'OpenFOAM-$FOAM_VERSION/etc/bashrc' not found."
    return 1
fi

export CPATH=$CPATH:$PREFIX/include
export LIBRARY_PATH=$LIBRARY_PATH:$FOAM_LIBBIN:$PREFIX/lib
#Pstream library folder
export FOAM_MPI_LIBBIN=$FOAM_LIBBIN/$FOAM_MPI

cd $SRC_DIR/ThirdParty-$FOAM_VERSION
# Only if the sources are downloaded
if [ $BUILD_MODE == "download" ]; then
	cp $RECIPE_DIR/3rdParty3.0.1makeCGAL.patch .
	patch < 3rdParty3.0.1makeCGAL.patch
fi
# -- COMPILE -- 
export WM_CC=$CC
export WM_CXX=$CXX
export WM_LD_FLAGS+=" -Wl,-rpath,$PREFIX/lib -L$PREFIX/lib"
cd $FOAM_SRC_DIR
./Allwmake -j

# -- INSTALL --
#Scotch and Ptscotch libraries compiled with mpi-system version of MPI
cp $FOAM_EXT_LIBBIN/mpi-system/* $PREFIX/lib

# Copy the whole directory structure to $PREFIX/opt:
mkdir $PREFIX/opt
cp -R $FOAM_SRC_DIR $PREFIX/opt
