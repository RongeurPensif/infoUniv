#!/bin/bash
taille=$( wc -l < temp )
for i in  $(seq 1 $taille); do
	if [$(($i % 2)) -eq 0 ]; then
		cat -n /etc/passwd | head -n $i | tail -n | cut -f2
	fi
done
