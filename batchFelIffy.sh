#!/bin/bash
#Script to test if can submit 500 jobs in Thomas queue

hdir=`pwd`
qhaDirs="FREN FREN_129_B2 FREN_142_B3 ACC_PERF"

for j in $qhaDirs; do 
  cd $j
  dispList=$(echo 4.*_*.*)
  for i in $dispList; do 
    cd $i
#   cp ../../qhaSUBstuff/* .
    cp ../../qhaFel.pbs .
    sed -i 's/ISYM   =     0/#ISYM=0/g' INCAR
    sed -i 's/NBANDS = 384/NBANDS = 336/g' INCAR
    sed -i 's/xxNAMExx/j'$j$i'/g' qhaFel.pbs
    sed -i 's/NPAR=2/NPAR=1/g' INCAR
    echo "im in" `pwd`
    
    if [ $(tail -n 2 OUTCAR | head -n 1 | head -c 27) == "M" ]; then echo $j/$i && echo $j/$i >> ../../alreadyDone.jobs ; else echo $j/$i  >> ../../submitting.jobs && qsub qhaFel.pbs ; fi     

    cd $hdir/$j
  done
  cd $hdir
done

echo " " 
echo "alreadyDone.jobs is :"
cat alreadyDone.jobs
echo " "
echo "submitting.jobs is :"
cat submitting.jobs
echo "DONE.""
