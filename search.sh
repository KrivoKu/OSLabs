#!/bin/bash
search(){
if [[ -z $1 || -z $2 ]]
then
echo "Error: Please enter directory and string, you want to find"
exit -1
fi
if ! [[ -d $1 ]]
then
echo "Error: Unable to find directory"
exit -4
fi
if ! [[ -r $1 ]]
then
echo "Unable to read files from directory" 
exit -6
fi
grep -r $2 $1 2>/dev/null
}
