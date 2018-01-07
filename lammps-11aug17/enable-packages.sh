make no-all                                                                                                    
while read p; do
  make "yes-$p"
done <${RECIPE_DIR}/lammps_packages.in
