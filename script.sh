#/bin/bash

ModuleList=(calc.sh search.sh reverse.sh log.sh exit.sh interactive.sh strlen.sh help.sh)

AvalibleModules(){
for index in ${!ModuleList[*]} 
do
	if [[ -r ${ModuleList[$index]} ]]
	then
		echo ${ModuleList[$index]}
	fi
done
}

checkFile(){
if ! [[ -r $1 ]]; then
	echo "Error: Action is not availible, no permisson to use file"
	exit -4
else
	source $1
fi
}

case "$1" in
	calc)
	checkFile "calc.sh" 
	calc $2 $3 $4
	;;
	search) #string finder
	checkFile "search.sh"
	search $2 $3
	;;
	reverse)
	checkFile "reverse.sh"
	reverse $2 $3
	;;
	strlen)
	checkFile "strlen.sh"
	strlen "$2"
	;;
	log)
	checkFile "log.sh"
	log
	;;
	exit)
	#checkFile "exit.sh"
	./exit.sh "$2"
	;;
	help)
	checkFile "help.sh"
	getHelp
	;;
	interactive)
	checkFile "interactive.sh"
	InteractiveMenu
	;;
	*)
	echo "Error: Incorrect action tried" 
	exit -2
esac
