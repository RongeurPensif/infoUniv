#!bin/bash
set v 
egrep -n '^(Scène|Acte|Rideau)' /home/tpcost.loc/o2185120/Bureau/L2-S3/OutilsDev/tp5/ > /tmp/nums
numtmp=$(grep -n "$1" /tmp/nums| cut  -d':' -f1)
echo $numtmp
lignedebut=$(head -n $numtmp /tmp/nums |tail -n 1|cut -d':' -f1)
echo $lignedebut
lignedebut=$(head -n $numtmp /tmp/nums | tail -n 1| cut -d':' -f1)
echo $lignefin
lignedebut=$((lignedebut+1))
echo $lignedebut
longueurscene=$((lignefin-lignedebut))
echo $longeurscene
cat /home/tpcost.loc/o2185120/Bureau/L2-S3/OutilsDev/tp5/|tail -n +$lignedebut|head -n $longueurscene > tmp/scene