#!/bin/bash
file="task4.txt"
proc=$(ps -eo pid|tail -n +2)
if [[ -f $file ]]
then
	touch $file
fi
for pid in $proc
do
path="/proc/"$pid
if [[ -e $path"/status" && -e $path/"sched" ]]
then
	ppid=$(grep "PPID*:" $path/"status" |grep -oE "[0-9]+")
	if [[ -z $ppid ]]
	then
		ppid=0
	fi
	rtime=$(grep "se.sum_exec_runtime" $path"/sched" | grep -oE "[0-9]+")
	swtc=$(grep "nr_swithches" $path"/sched"|grep -oE "[0-9]+")
	if [[ -z $swtc || $swtc = "0" || -z $rtime ]]
	then
		ART=0
	else
		ART=$(echo "scale=5; $rtime/$swtc" | bc | awk '{printf "%f", $0}')
	fi
	echo "$pid $ppid $ART"
fi
done | sort -nk2 | awk '{print "PID = "$1" : PPID = "$2" : AVGRuntime = "$3}' > task4.txt