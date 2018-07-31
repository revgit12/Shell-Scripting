#!/bin/bash

c=1

for i in "$@"
do
	echo "$c . argument:$i"
	let c++
done
