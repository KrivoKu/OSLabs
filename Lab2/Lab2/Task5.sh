#!/bin/bash

file="task4.txt"
file1="task5.txt"
curr_ppid="0"
ART_SUM="0"
count="1"

if [[ -f file ]]
then
	echo "Result of previous task wasn't found" 
	exit 1
fi

if [[ -f file1 ]]
then
	touch file1
fi

echo "$(<task4.txt)\n" | 
while read str;
do
	pid=$(awk '{print $1}' <<< $str | grep -oE "[0-9]+")
	ART=$(awk '{print $3}' <<< $str| grep -oE "[0-9]+")
	ppid=$(awk '{print $2}' <<< $str| grep -oE "[0-9]+")
	if [[ $ppid == $curr_ppid ]] 
	then
		ART_SUM=$(echo "scale=5; $ART_SUM+$ART" | bc |awk '{printf "%f", $0}')
		count=$(($count+1))
	else
		AVG=$(echo "scale=5; $ART_SUM/$count"| bc | awk '{printf "%f", $0}')
		echo "Average_Children_Running_Time_of_Parent_ID="$curr_ppid" is $AVG"
		ARTSUM=$ART
		curr_ppid=$ppid
		count=1
	fi
	if ! [[ -z $pid ]]
	then
		echo "ProccessID =" $pid" : ParentProccesID ="$ppid" : Average_Running_Time =" $ART
	fi
done > task5.txt
