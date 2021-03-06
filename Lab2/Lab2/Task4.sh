#!/bin/bash
if [ ! -f task4.txt ]; then
	touch task4.txt
fi
for pid in (ps -Ao | tail -n 2)
do
path="/proc/"$pid
if [[ -d $path ]]
then
	status=$path"/status"
	sched=$path"/sched"
	ppid=$(cat $status| grep "PPid:*" | awk '{ print $2 }')
	if [[ -z $ppid ]]
	then
		ppid=0
	fi
	rtime=$(cat $sched|grep "sum_exec_runtime" | awk '{print $3}' )
	swtc=$(cat $sched| grep "nr_switches" | awk '{print $3}'
		ART=$(echo "scale=5; $rtime/$swtc" | bc -l)
	fi
	echo "$pid $ppid $ART"
fi
done | sort -nk2 | awk '{print "PID = "$1" : PPID = "$2" : AVGRuntime = "$3}' > task4.txt
