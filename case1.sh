#!/bin/bash

echo -n "Enter name:"
read n
echo -n "Age:"
read a
echo -n "Department:"
read d

echo "You have entered following: "
echo "Name:	     $n"
echo "Age:	     $a"
echo "Department:    $d"
check=0
while [ $check -eq 0 ]
do

echo -n "Is your data correct?"
read q

case "$q" in

	"Y"|"y" )
		echo "Name:          $n" >> empl.txt
		echo "Age:           $a" >> empl.txt
		echo "Department:    $d" >> empl.txt
		echo "======================" >> empl.txt
		check=1
		;;
	"N"|"n" )
		echo "Nothing was saved,run again"
		check=1
		;;
	*)
		echo "Invalid option"
	;;
esac

done
