#!/bin/bash

addition(){

local x=$1
local y=$2

z=$[$x+$y]

echo "Result is :$z"

}

echo -n "Enter 1st num:"
read x
echo -n "Enter 2nd num:"
read y

addition $x $y



