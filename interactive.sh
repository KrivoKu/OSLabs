#!/bin/bash
InteractiveMenu(){
echo "======MENU======="
echo "a)calc"
echo "b)search"
echo "c)reverse"
echo "d)strlen"
echo "e)log"
echo "f)help"
echo "g)exit"
echo "Type 'Modules' if you want to see avalible modules" 

echo "Pick key to start"
read key

case "$key" in
	a)
	checkFile "calc.sh"
	echo "Choose action (sum|sub|calc|div)"
	read act
	echo "Enter first number"
	read num1
	echo "Enter second number"
	read num2
	calc $act $num1 $num2
	;;
	b)
	checkFile "search.sh"
	echo "Enter directory:"
	read file
	echo "Enter string you want to find"
	read string
	search $file $string
	;;
	c)
	checkFile "reverse.sh"
	echo "Enter first file"
	read file1
	echo "Enter second file"
	read file2
	reverse $file1 $file2
	;;
	d)
	checkFile "strlen.sh"
	echo "Enter your string"
	read string
	strlen "$string"
	;;
	e)
	checkFile "log.sh"
	log
	;;
	f)
	checkFile "help.sh"
	getHelp
	;;
	g)
	exit 0
	;;
	Modules)
	echo "===========Avalible Modules============="
	AvalibleModules
	echo "========================================"
	;;
	*)
	echo "Wrong key enetered"
	echo "Want to try again[Y/N]"
	read a
	case "$a" in
		Y)
		InteractiveMenu
		;;
		N)
		exit -1
esac
esac
InteractiveMenu
}

