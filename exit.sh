
#!/bin/bash
if ! [[ $1 =~ ^-?[0-9]+$ ]]
then
echo "Error: Code must be an integer number"
command exit -1
elif [[ $1 =~ ^-?[0-9]+$ ]]
then
if [[ $1 -lt -255 || $1 -gt 255 ]]
then
echo "Error: Code must be from -255 to 255"
command exit -1
else
command exit $1
fi
else 
command exit 0
fi
