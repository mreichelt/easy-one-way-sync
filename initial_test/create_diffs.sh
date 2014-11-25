#!/bin/bash

N=5
for ((i=1;i<=$N;i++)); do
	for ((j=$i+1;j<=$N;j++)); do
		echo "diff $i --> $j"
		diff --minimal "$i.json" "$j.json" > "diffs/${i}_${j}.diff"
	done
done
