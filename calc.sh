#!/bin/bash
calc(){
if [[ "$1" != "sum" && "$1" != "sub" && "$1" != "mul" && "$1" != "div" ]]
then
echo "Error: Wrong action tried"
exit -2
elif ! [[ $2 =~ ^[+-]?[0-9]+$ && $3 =~ ^[+-]?[0-9]+$ ]]
then
echo "Error: You need two integer numbers for program to work"
exit -1
elif [[ $1 == "div" && $3 == "0" ]]
then
echo "Error: You can't divide by 0"
exit -5
elif [[ $1 == "div" && $3 == "-0" ]]
then
echo "Error: You can't divide by 0"
exit -5
elif [[ $1 == "div" && $3 == "+0" ]]
then
echo "Error: You can't divide by 0"
exit -5
else
case "$1" in
	sum)
	echo $(($2+$3))
	;;
	sub)
	echo $(($2-$3))
	;;
	mul)
	echo $(($2*$3))
	;;
	div)
	echo $(($2/$3))
esac
fi
}
