#!/bin/bash

count=0
curr_ppid=0
sum=0

if ! [ -f "task4.txt" ]; then
	echo "No file with result of previous task"
fi

if ! [ -f "task5.txt" ]; then
	echo "File task5.txt created, the results will be saved here"
	touch task5.txt
fi

for str in $(cat "task4.txt"); do
	ppid=$(echo $str|cut -d ":" -f 2| cut -d "=" -f 2)
	if [ $ppid != $curr_ppid ]; then
		if [ $cnt == 0 ]; then
			$curr_ppid=$ppid
			continue
		else
			art=$(echo $str|cut -d ":" -f 3|cut -d "=" -f 2)
			sum=$art+$sum
			let count++
			avg_art=$(echo $sum/$cnt | bc -l)
			echo "Average_Sleeping_Childern_Time_of_Parent = $curr_ppid is $avg_art"
			curr_ppid=$ppid
		fi
	fi
	let count++
	art=$(echo $str|cut -d ":" -f 3|cut -d "=" -f 2)
	sum=$(echo $sum+$art"
done > "task5.txt"
