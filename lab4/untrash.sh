#!/bin/bash

TRDIR="/home/user/.trash/"
TRLOG="/home/user/.trash.log"
HOM="/home/user"

function untrash()
{
	FN=$1
	TN=$2
	RDIR=$(echo "$FN" | awk 'BEGIN{FS=OFS="/"}; {$NF="";print $0}')
	FNN=$(echo "$FN"| awk 'BEGIN{FS="/"}; {print $NF}')
	NFN=""

	if[[ ! -d $RDIR ]]; then
		echo "$RDIR doesn't exist. \"${FNN}\" will be restored in home direcory"
		if [[ -f "$HOM/$FNN" ]]; then
			read -p "File $FNN already exists. Please enter new name: " NFN
			ln "$TRASHDIR/$TN" "$HOM/$NFN"
			rm "$TRASHDIR/$TN"
		else
			ln "$TRASHDIR/$TN" "$HOM/$FNN"
			rm "$TRASHDIR/$TN"
		fi
	else
		if [[ -f $FN ]]; then
			read -p "File already existst. Please enter new name: " NFN
			ln "$TRASHDIR/$TN" "$RDIR/$NFN"
			rm "$TRASHDIR/$TN"
		else
			ln "$TRASHDIR/$TN" "$RDIR/FNN"
			rm "$TRASHDIR/$TN"
	fi
}

if ! [[ $# -eq 1 ]]; then
	echo "Args error"
	exit 1
fi

if ! [[ -d $TRDIR ]]; then
	echo "Trash directory is not correct"
	exit 2
fi

if ! [[ -f $TRLOG ]]; then
	echo "Log file was not found"
	exit 3
fi


for str in $(grep "$1" $TRASHLOG | awk '{print $NF}'); do
	FN=$(grep $str $TRASHLOG | awk '{$NF=""; print $0}')
	FN=$(echo $FN | sed 's/ *$//')
	read -p "restore $FN ? [yes/no]" ans
	case $ans in 
		"YES" | "yes")
			restore $FN $str
			sed "/${str}/d" $TRASHLOG > /home/user/.trash.log2 && mv /home/user/.trash.log2 $TRASHLOG
		;;
		*)
			continue
		;;
	esac
done
