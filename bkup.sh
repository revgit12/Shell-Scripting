#!/bin/bash

prod=/root/shellscripting/wildcard

if [ $# -ne 1 ]
then
	echo "one argument is required"
	exit 1
fi

dest=$1

if [[ $dest != */backup  ]]
then
	echo "wrong dest path"
	exit 2
fi

dat=$(date +%Y-%m-%d_%H_%M_%S)
mkdir -p $dest/$dat

cp -rf $prod/*.pdf $dest/$dat


if [ $? -eq 0 ]
then
	echo "Backup success"
else 
	echo "Failed"
fi

