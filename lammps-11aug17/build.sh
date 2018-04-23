#export LIBRARY_PATH=$PREFIX/lib
pwd
cd src
bash ${RECIPE_DIR}/enable-packages.sh make
make -j mpi
cp lmp_mpi $PREFIX/bin
