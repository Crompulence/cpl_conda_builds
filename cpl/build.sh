source ./SOURCEME.sh
make
cp ./lib/* $PREFIX/lib
mkdir $PREFIX/include/cpl
cp ./include/cpl/* $PREFIX/include/cpl
