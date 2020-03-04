#!/bin/bash
rep="haddock"
for nom in $(ls $rep); do
	droits=$( ls -l "$rep/$nom" | tr -s '' | cut -d '' -f1 )
	if [ $( echo $droit | cut -c 1 ) = "i"]; then
		echo "fichier: $nom"
		echo "nombre de ligne: $( cat "$rep/$nom" | wc -c)"
		echo "nombre de caracteres: $( cat "$rep/$nom")"
		prop=$( ls -al "$rep/$nom" | tr -s '' | cut -d '' -f3)
		echo "proprietaire:$prop"
	fi
done
