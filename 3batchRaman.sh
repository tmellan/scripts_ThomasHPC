#!/bin/bash

list=$(for i in {0..180}; do abit=$(echo "$i+1" | bc -l) ; cbit=$(echo "$abit+0" | bc -l)  ; echo $abit"_"$cbit ; done)
hdir="/home/mmm0011/Scratch/SPECTROSCOPY/INITIAL/ZR8C7"
cd $hdir

for i in $list; do 
  pwd
  rm -r $i
  mkdir $i
  cp $hdir/RUNFiles/* $i/.
  cd $i
  sed -i 's/KPAR=4/KPAR=4/g' INCAR
  sed -i 's/xxNAMExx/j'$i'_zr6c5/g' phon.pbs
  sed -i 's/xxMODExx/'$i'/g' phon.pbs 
  qsub phon.pbs 
  cd $hdir
done
wait
