#!/bin/bash
rep="haddock"
for nom in $( ls $rep); do
	droits=$(echo $droits|tr -s ''|cut -d '' -f1)
	if [ $(echo $droits|cut -c 1) = '-']; then
	echo "$nom" >> resume1.txt
	cat -n "$rep/$nom"|head -n 3 >> resume1.txt
	fi
done
