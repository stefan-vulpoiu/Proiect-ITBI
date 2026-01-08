#!/bin/bash

before="stare_initiala.txt"
after="stare_finala.txt"

echo "starea initiala:"
ls -l > "$before"
df -h >> "$before"

echo  "starea initiala a fost salvata in $before"
read -p "Apasa tasta ENTER dupa ce ai terminat modificarile pentru a continua."

echo "starea finala:"
ls -l > "$after"
df -h >> "$after"

awk  'NF==9 {print $0}' "$before" > ls_before.txt
awk  'NF==9 {print $0}' "$after" > ls_after.txt

grep "%" "$before" > df_before.txt
grep "%" "$after" > df_after.txt

diff  ls_before.txt ls_after.txt > modificari_ls.txt

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
