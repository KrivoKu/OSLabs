#!/bin/bash

K=$1
N=$2

for(( counter=0; counter < $K ; counter++ ))
do
	./newmem.sh $2 &
done

