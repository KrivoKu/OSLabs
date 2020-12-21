#!/bin/bash
./mem.sh&pid0=$!
rm datamem
touch datamem
while true; do
	line=$(top -p $pid0 -b -n 1 | head -8 | tail -n +8)
	free=$(top -o "%MEM" -b -n 1| head -4| tail -n +4| awk '{print ""$6""}')
	swap=$(top -o "%MEM" -b -n 1| head -5| tail -n +5| awk '{print ""$5""}')
	line=$(echo -e $line | awk '{print ""$11" "$10" "$5" "$6" "$7" "$9""}')
	echo -e "$line $free $swap\n" >> datamem
	sleep 30
done
