#!/bin/bash
ps auxw | while read -r user pid restul liniei
do
echo "$user $pid"
done
