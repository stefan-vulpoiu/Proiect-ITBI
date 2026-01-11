#!/bin/bash

ls -l > ls_before.txt
df -h > df_before.txt

echo  "starea initiala a fost salvata"
read -p "Apasa tasta ENTER dupa ce ai terminat modificarile pentru a continua"

ls -l > ls_after.txt
df -h > df_after.txt

diff ls_before.txt ls_after.txt > modificari_ls.txt

if [ ! -s modificari_ls.txt ]; then
	echo "nu sunt modificari; fisierele sunt identice"
else
	echo "nou aparut:"
	grep "^> " modificari_ls.txt
	echo "linii sterse:"
	grep "^< " modificari_ls.txt
fi

diff -y --suppress-common-lines df_before.txt df_after.txt > modificari_df.txt

if [ ! -s modificari_df.txt ]; then
	echo "nicio modificare"
else
	echo "vechi  |  nou"
	cat modificari_df.txt
fi
