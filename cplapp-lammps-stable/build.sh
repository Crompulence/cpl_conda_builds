CONDA_PYTHON=$(conda info --root)/bin/python
${CONDA_PYTHON} ${RECIPE_DIR}/download-extra-sources.py
echo "$SRC_DIR/../LAMMPS-STABLE" > CODE_INST_DIR
echo "python" >> $SRC_DIR/config/lammps_packages.in
cp $SRC_DIR/config/lammps_cpl.patch $SRC_DIR/../LAMMPS-STABLE
export LIBRARY_PATH=$PREFIX/lib
make yes-all
make patch-lammps
make -j
cp bin/lmp_cpl $PREFIX/bin
