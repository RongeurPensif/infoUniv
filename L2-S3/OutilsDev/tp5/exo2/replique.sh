#!bin/bash
cat cyrano.clean | grep '^[A-Z][A-Z ]*(.*):$' | cut -d'(' -f1 > /tmp/avec
cat cyrano.clean | grep '^[A-Z][A-Z ]*:$' | tr -s ':' ' ' > /tmp/sans
(cat /tmp/avec; cat/tmp/sans)>/tmp/glob
cat /tmp/glob | sort |uniq -c
