make no-all                                                                                                    
while read p; do
  $MAKE "yes-$p"
done <$APP_DIR/config/lammps_packages.in
