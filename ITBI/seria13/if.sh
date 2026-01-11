#!/bin/bash

read filename
if [ ! -e "$filename" ]; then
	echo "$filename does not exist"
elif [ -f "$filename" ]; then
	echo "$filename is a regular file"
else
	echo "$filename exists, but ww don't know what kind of file it is"
fi

