#!/bin/bash

tail -n +3 ../data/cuisine/recette | sort > tmp/recette
tail -n +3 ../data/cuisine/prix | sort > tmp/prix

join -o 1.2,2.3 /tmp/recette /tmp/prix

prix=0
while read a b; do
 prix=$( echo "prix + $a $b" | bc -l )
done
echo $prix

rm /tmp/recette
rm /tmp/prix
rm /tmp/prixRecette
