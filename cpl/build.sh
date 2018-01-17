source ./SOURCEME.sh
# Build json-fortran
mkdir -p $CPL_THIRD_PARTY_LIB
mkdir -p $CPL_THIRD_PARTY_INC
bash ./make/json-fortran.build
#NOTE: This causes problems since redefine compiler flags.
#      Cmake does not like it.
#make json-fortran
make json-support=true
cp ./lib/* $PREFIX/lib
cp ./3rd-party/lib/* $PREFIX/lib
mkdir $PREFIX/include/cpl
cp ./include/cpl/* $PREFIX/include/cpl
