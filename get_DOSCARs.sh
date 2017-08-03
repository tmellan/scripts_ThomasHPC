#!/bin/bash
hdir=`pwd`
list="4.658285 4.685 4.730 4.759 4.801 4.850 4.875 4.900"

name="129"

mkdir el_dos_$name
for i in $list; do 
  cd DOS_$i
  ef=$(sed -n '6,6p' DOSCAR | awk '{print $4}')
  sed -n '7,5006p' DOSCAR | awk -v var="$ef" '{print $1-var, $2, $3}' | column -t > ../el_dos_$name/dos.$i
  cd $hdir
done

cp -r el_dos_$name ../dos_el_all/.
