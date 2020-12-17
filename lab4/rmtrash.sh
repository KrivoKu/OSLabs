#!/bin/bash

FILE="$PWD/$1"
LNAME=$(date+"%s")

if [[ $# > 1 ]]; then
	echo "Too many args"
	exit 1
fi

if [[ $# < 1 ]]; then
	echo "Not enough args"
	exit 2
fi

if !  [[ -f $1 ]]; then
	echo "No such file as $1"
	exit 3
fi

if ! [[ -d "/home/user/.trash" ]]; then
	mkdir /home/user/.trash
	touch /home/user/.trash.log
fi

ln "$FILE" "/home/user/.trash/$LNAME"
echo "$FILE $LNAME" >> /home/user/.trash.log
rm "$FILE"

