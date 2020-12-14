#!/bin/bash

num=1
cmd="+"

function TERM()
{
	echo "Finale"
	exit 0;
}

function SIG1()
{
	cmd="+"
}

function SIG2()
{
	cmd="+"
}

trap "TERM" SIGTERM
trap "SIG1" USR1
trap "SIG2" USR2

while true; do
	case "$cmd" in
		"+")
			num=$(($num+1))
		;;
		"*")
			num=$(($num*2))
		;;
		esac
	echo $num
	sleep 1
done
