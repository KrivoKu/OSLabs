#!/bin/bash

rm report.log
touch report.log
declare -a array
declare -a numbers=(1,2,3,4,5,6,7,8,9,10)

while true; do
	array+=(${numbers[@]})
	let counter++
	if [[ $counter == 100000 ]]; then
		echo "${#array[@]}" >> report.log
		counter=0
	fi
done
