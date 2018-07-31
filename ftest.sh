#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Enter an argument"
	exit 1
fi

f=$1

if [ -f $f ]
then
	rea="NO"
	wri="NO"
	exe="NO"
        
	if [ -r $f ]
	then
		rea="YES"
	fi
	if [ -w $f ]
	then
		wri="YES"
	fi
	if [ -x $f ]
	then
		exe="YES"
	fi
	
	echo "===FILE: $f==="
	echo "READ:   $rea"
	echo "WRITE:  $wri"
	echo "EXECUTE:$exe"
	echo "=============="

else
	if [ -d $f ]
	then
		echo "$f is a directory"
	else
		echo "$f doesn't exists"
	fi
fi


