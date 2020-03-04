#!/bin/bash
deb=1;
pas=1;
case $# in
 1)fin=$1;;
 2)deb=$1; fin=$2;;
 3)deb=$1; fin=$2; pas=$3;;
 *)echo "nb arguments incorrect"; exit 1;;
esac;
echo "wet " $deb $fin $pas;
i=$deb;
while [[$($i -le $fin)]]; do
 echo $i;
 i=$( $i + $pas );
done
