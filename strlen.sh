#!/bin/bash
function strlen(){
if [[ "$#" -eq 0 ]]
then
echo "Error: no string entered" 
exit -1
else
expr length "$1"
fi
}
