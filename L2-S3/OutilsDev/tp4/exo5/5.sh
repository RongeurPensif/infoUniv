#!bin/bash

max=0
chercherLigne() {
	n=0
	nbl=$( cat $2 | wc -l )
	for i in $( seq $nbl ); do
		ligne=$( cat $2 | head -n $i | tail -n 1)
		if [ "$ligne" = "$1" ]; then
			n=$( echo "$n+1" | bc)
		fi
	done
	return $n
}
#comparaison des caractères est un = -eq valeur numérique

chercherMax() {
	taille=$( cat $1 | wc -l)
	ligneMax=$( cat $1 | head -n 1 | tail -n 1)
	chercherLigne $ligneMax $1
	max=$?
	for i in $( seq 2 $taille ); do
		ligne=$( cat $1 | head -n $i | tail -n 1)
		n=$?
		chercherLigne $ligne $1
		if [ "$max" < "$n" ]; then
			max=$n
			ligneMax=$ligne
		fi
	done
	echo $ligneMax
}

chercherMax "/home/tpcost.loc/o2185120/Bureau/L2-S3/OutilsDev/tp4/listeMot"
