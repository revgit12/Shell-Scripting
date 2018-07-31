#!/bin/bash

if [ $# -ne 1 ]
then
	echo "1 argument is needed"
	exit 1
fi

if ! [ -f $1 ]
then
	echo "File doesn't exists"
	exit 2
fi


fname=$1
count=1

cat "$fname" |
while read line
do
	echo "$count: $line"
	let count++
done



