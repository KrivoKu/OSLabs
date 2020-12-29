#!/bin/bash
if ! [ -f "task6.txt" ]; then
	touch task6.txt
fi
maxsize=-1
pid=-1
for curr_pid in $(ls /proc| grep -oE "[0-9]+")
do
	curr_mem=$(cat "/proc/$curr_pid/statm" | awk '{print $2}')
	if [ $curr_mem -gt $maxsize ]; then
		pid=$curr_pid
		maxsize=$curr_mem
	fi
done
echo "$pid : $maxsize" > task6.txt
