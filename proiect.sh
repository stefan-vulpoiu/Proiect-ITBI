#!/bin/bash

if [ $# -ne 2 ]; then
	echo "avem nevoie de 2 fisiere pentru a putea evalua situatia de dinainte si de dupa modificarile efectuate"
	exit 1
fi
before=$1
after=$2
