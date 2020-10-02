#!/bin/bash
function strlen(){
if [[ -z $1 ]]
then
echo "Error: no string entered" 
exit -1
else
expr length "$1"
fi
}
