#!/bin/bash

if [ $# -ne 1 ]
then
	echo "one argument is required"
	exit 1
fi

v=$1

regex="[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[[:digit:]]{1,3}"

if ! [[ $v =~ $regex ]]
then
	echo "no ip found"
	exit 2
fi

ip=${BASH_REMATCH[0]}

ping -c4 $ip 1>/dev/null

if [ $? -eq 0 ]
then
	status="ALIVE"
else
	status="DEAD"
fi

echo "IP found: $ip($status)"


