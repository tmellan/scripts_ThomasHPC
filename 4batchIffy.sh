#!/bin/bash

list=$(for i in {0..191}; do abit=$(echo "$i+1" | bc -l) ; cbit=$(echo "$abit+0" | bc -l)  ; echo $abit"_"$cbit ; done)

#CUSTOM list based on top 45 instensity sorted lines from the rough calculated. the provides 100 to 1 resolution.
#shortList=$(awk '{print $1}' intensity.sorted.116)
#list=$(for i in $shortList; do echo $i"_"$i ; done)

hdir=`pwd`
#hdir="/home/mmm0011/Scratch/SPECTROSCOPY/550/FREN_70/IBRION5"
name="F70"
cd $hdir

echo doing backup
mkdir ../backup
rsync -av --exclude OUTCAR* * ../backup/.
echo backup done

for i in $list; do 
  pwd
  cd $i
  if [[ $(tail -n 1 job.out | awk '{print $1}') == "Born" ]]; then 
    echo done && echo done $i >> done.list
    else echo doing && cp $hdir/RUNFiles/OUTCAR.phon . && cp $hdir/RUNFiles/POSCAR . && sed -i 's/mpi 48/mpi 24/g' phon.pbs && qsub phon.pbs && echo doing $i >> doing.list
  fi
  cd $hdir
done
wait
