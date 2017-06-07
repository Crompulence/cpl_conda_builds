FOAM_VERSION=3.0.1
FOAM_DIR_NAME=OpenFOAM-$FOAM_VERSION
echo "$PREFIX/opt" > CODE_INST_DIR
source SOURCEME.sh
make
cp lib/* $PREFIX/lib
cp bin/* $PREFIX/bin
