#!/bin/bash
hdir=`pwd`
list="4.658285 4.685 4.730 4.759 4.801 4.850 4.875 4.900"
for i in $list; do 
  mkdir DOS_$i
  cd $i"_0.330"
  cp INCAR POTCAR KPOINTS POSCAR qhaFel.pbs ../DOS_$i
  cd ../DOS_$i

  sed -i 's/#NEDOS = 5000/NEDOS = 5000/g' INCAR
  sed -i 's/#NGXF = 120/NGXF = 320/g' INCAR
  sed -i 's/#NGYF = 120/NGYF = 320/g' INCAR
  sed -i 's/#NGZF = 120/NGZF = 320/g' INCAR
  sed -i 's/#EMIN = -7/EMIN = -10/g' INCAR
  sed -i 's/#EMAX = 1/EMAX = 15/g' INCAR
  sed -i 's/ISMEAR =     -1/ISMEAR =     -5/g' INCAR
  qsub qhaFel.pbs
  cd $hdir
done
