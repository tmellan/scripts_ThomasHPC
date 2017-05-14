#!/bin/bash
#Script to test if can submit 500 jobs in Thomas queue

hdir=`pwd`

for i in {1..500}; do 
  rm -r $i ; mkdir $i
  cp subSTUFF/* $i/.
  cd $i
  sed -i 's/xxNAMExx/Job'$i'/g' test.pbs
  qsub test.pbs
  cd $hdir
done
