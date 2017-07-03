CONDA_PYTHON=$(conda info --root)/bin/python
${CONDA_PYTHON} ${RECIPE_DIR}/download-extra-sources.py
echo "$SRC_DIR/../LAMMPS-DEV" > CODE_INST_DIR
cp $SRC_DIR/config/lammps_cpl.patch $SRC_DIR/../LAMMPS-DEV
make yes-all
make patch-lammps
make -j
cp bin/lmp_cpl $PREFIX/bin
