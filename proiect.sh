#!/bin/bash

if [ $# -ne 2 ]; then
	echo "avem nevoie de 2 fisiere pentru a putea evalua situatia de dinainte si de dupa modificarile efectuate"
	exit 1
fi
before=$1
after=$2

awk  'NF==9 {print $0}' "$before" > ls_before.txt
awk  'NF==9 {print $0}' "$after" > ls_after.txt

grep "%" "$before" > df_before.txt
grep "%" "$after" > df_after.txt

diff ls_before.txt ls_after.txt > modificari_ls.txt

if [ ! -s modificari_ls.txt ]; then
	echo "nu sunt modificari; fisierele sunt identice"
else
	echo "nou aparut:"
	grep "^> " modificari_ls.txt
	echo "linii sterse:"
	grep "^< " modificari_ls.txt
fi
