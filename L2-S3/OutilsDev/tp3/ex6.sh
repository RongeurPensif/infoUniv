#!/bin/bash
find "haddock" -type f -print > temp
taille=$( wc -l < temp )
for i in $( seq 1 $taille ); do
	cat -n temp|head -n$i|tail -n 1 | cut -f2 > ligne
	cat ligne|cut -d '/' > fnom
	cat fnom >> resume.txt
	fnom=$( cat ligne )
	cat -n "$fnom"|head -n 3 >> resume.txt
done
