#!/bin/bash

diffsum ()
{
	find diffs -type f -name "$1" -print0 | xargs -0 ls -l | awk '{x+=$5} END {print "sum for pattern '$1': " x}';
}

N=5
for ((i=1;i<=$N;i++)); do
	for ((j=$i+1;j<=$N;j++)); do
		echo "diff $i --> $j"
		diff --minimal "$i.json" "$j.json" > "diffs/${i}_${j}.diff"
		bsdiff "$i.json" "$j.json" "diffs/${i}_${j}.bsdiff"
		vcdiff encode -dictionary "$i.json" < "$j.json" > "diffs/${i}_${j}.vcdiff"
	done
done

diffsum '*.diff'
diffsum '*.bsdiff'
diffsum '*.vcdiff'
