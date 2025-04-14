#!/usr/bin/env bash

#From some ENA database output - how many species are in our dataset
#Usage: ./ena_results3.sh [files]

for file in "$@"
do
        echo "The number of species in {$file} is $(tail -n +2 $file |cut -f 6 |sort | uniq |wc -l)"
done

#just doing this for git work
cd ..
cd github_class/
ls