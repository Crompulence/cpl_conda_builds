unset LD_LIBRARY_PATH
cd $SRC_DIR/flowmol/src
make PLATFORM=gfortran BUILD=opt USE_COUPLER=yes p
cp parallel_md.exe $PREFIX/bin/
