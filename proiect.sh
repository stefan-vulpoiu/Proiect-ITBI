#!/bin/bash

if [ $# -ne 2 ]; then
	echo "avem nevoie de 2 fisiere pentru a putea evalua situatia de dinainte si de dupa modificarile efectuate"
	exit 1
fi
before=$1
after=$2

awk  'NF==9 {print $0}' "$before" > ls_before.txt
awk  'NF==9 {print $0}' "$after" > ls_after.txt

grep "/$" "$before" > df_before.txt
grep "/$" "$after" > df_after.txt
