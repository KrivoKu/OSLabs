#!/bin/bash

declare -a array
declare -a numbers=(1,2,3,4,5,6,7,8,9,10)

while true; do
	array+=(${numbers[@]})
	let counter++
	if [[ $counter == 100000 ]]; then
		counter=0
	fi
	if [[ ${#array[@]} == $1 ]]; then
		exit 0
	fi
done
