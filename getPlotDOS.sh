#!/bin/bash

mkdir DOS_OUT
for i in `echo DOS_4.*`; do 
  cd $i
  rm tmp 2tmp
  sed -n '7,5006p' DOSCAR  > tmp ; ef=$(sed -n '6,6p' DOSCAR | awk '{print $4}') ; awk -v ef="$ef" '{$4=$1-ef; $5=$2}'1 tmp | column -t  > 2tmp
  awk '{print $4, $2}' 2tmp > ../DOS_OUT/$i
  rm tmp 2tmp
  cd ../
done
