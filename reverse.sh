#!/bin/bash
reverse(){
if [[ -z $1 || -z $2 ]];
then
echo "Error: You need to enter two files for program to work"
exit -2
fi
if ! [ -f $1 ];
then
echo "Error: File $1 wasn't found" 
exit -3
elif ! [ -r $1 ];
then
echo "Error: Unable to read file $1"
exit -4
elif ! [ -f $2 ];
then
touch $2 &> /dev/null
tac $1 | rev> $2
elif ! [ -w $2 ];
then
echo "Error: Unable to rewrite the file $2"
exit -4
else
text=$(tac $1)
echo "$text" | rev>$2
fi
}
