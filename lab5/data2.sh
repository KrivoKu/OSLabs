#!/bin/bash
./mem2.sh&pid1=$!
rm datamem2
touch datamem2
while true; do
	line=$(top -p $pid1 -b -n 1|head -8|tail -n +8)
	free=$(top -o "%MEM" -b -n 1|head -4|tail -n +4| awk '{print ""$6""}')
	swap=$(top -o "%MEM" -b -n 1|head -5|tail -n +5| awk '{print ""$5""}')
	line=$(echo -e $line| awk '{print ""$11" "$10" "$5" "$6" "$7" "$9""}')
	echo -e "$line $free $swap" >> datamem2
	sleep 30
done
