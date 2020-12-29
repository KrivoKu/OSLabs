#!/bin/bash
IFS=$'\n'

proc=$(ps -U "user" |tail -n +2| awk '{printf "%s:%s\n" ,$1,$4}')
echo $proc | wc -l > ans1.txt
echo -e $proc >> ans1.txt
