#!/bin/bash

cmd=""
result=1
tail -f pipe |
while true; do
	read line
	case $line in
		'*')
			cmd="$line"
		;;
		"+")
			cmd="$line"
		;;
		"exit")
			killall tail
			echo "Quit: handler"
			exit 0
		;;
		[0-9])
			case $cmd in
			 	"+")
					result=$(($result+$line))
					echo $result
				;;
				"*")
					result+$(($result+$line))
					echo $result
			esac
		;;
		*)
			killall tail
			echo "Hadler error"
			exit 1
		;;
	esac
done
