#!/bin/bash
file="task6.txt"
if ! [[ -f file ]]
then
	touch $file
fi
maxsize=-1
pid=-1
for curr_pid in $(ls /proc| grep -oE "[0-9]+")
do
	path="/proc/"$curr_pid"/status"
	if [[ -e $path ]]
	then
		size=$(grep "VmSize:" $path | awk '{print $2}')
		if [[ $size -gt $maxsize ]]
		then
			maxsize=$size
			pid=$curr_pid
		fi
	fi
done
echo "$pid : $maxsize" >$file
