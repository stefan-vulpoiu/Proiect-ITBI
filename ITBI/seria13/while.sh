#!/bin/bash
while [ "${INPUT_STRING:-hello}" != "bye" ]
do
	echo "Introduceti date (bye pentru a iesi din bucla)"
	read INPUT_STRING
	echo "Ati introdus: $INPUT_STRING"
done
