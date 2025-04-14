#!/usr/bin/env bash

#What is it doing? 
#Usage: bash count_little_women.sh

#(for name in Amy Jo Meg Beth; do echo -n "$name: "; grep -o "$name" ../../shared/439539/LittleWomen.txt | wc -l; done)
#for name in Amy Jo Meg Beth; do echo -n "$name: "; grep -o -i "$name" ../R/examsprep/test_little_women.txt | wc -w; done



for name in "Amy" "Jo" "Meg" "Beth" #loop through each name
do
	echo "$name" "$(grep -o -i $name $1 |wc -l)" #search for each occurance and count
done
