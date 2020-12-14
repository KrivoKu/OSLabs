#!/bin/bash

while true; do
	read line
	echo $line > pipe
	if [[ "$line" == "exit" ]]; then
		echo "Finale"
		exit 0
	fi
	if [[ "$line" != "+" && "$line" != "*" && "$line" != [0-9] ]]; then
		echo "Invalid line"
		exit 1
	fi
done
