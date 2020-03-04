#!bin/bash
nomfic=$1
temp=/tmp/cl.txt
cat $nomfic|tr -d '\r' > $temp
nld=$(cat $temp|grep -n '^\*\*\* START OF THIS'|cut -d':' -f1)
nlf=$(cat $temp|grep  -n '^\*\*\* END OF THIS'|cut -d':' -f1)
nld=$((nld+1))
nlf=$((nlf-1)) #pas besoin d'ajouter $ car il sont dans $(())
# \* <=> caractère *
cat $temp | head -n $nlf|tail -n +$nld #le + permet de prendre les dernier nière ligne sauf les nld première
