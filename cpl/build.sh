#git reset --hard 11e3858966232d283b67bdb932b8285c2490dfae
source ./SOURCEME.sh
make
cp ./lib/* $PREFIX/lib
mkdir $PREFIX/include/cpl
cp ./include/cpl/* $PREFIX/include/cpl
