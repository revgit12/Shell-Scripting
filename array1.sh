#!/bin/bash

arr=($(ls *.txt))
c=0

for i in "${arr[@]}"
do
	echo -n "$i"
	echo -n "[${#arr[$c]}]"
	if [ -w "$i" ]
	then
		echo -e "\t YES"
	else
		echo -e "\t NO"
	fi
	let c++
	
done
