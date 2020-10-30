#!/bin/bash


proc=$(ps -U "user" |tail -n +2| awk '{print $1:$4}')
proc_count=$(echo "$proc"|wc -l)
echo $proc_count > ans1.txt
echo -e $proc >> ans1.txt
