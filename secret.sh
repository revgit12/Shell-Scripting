#!/bin/bash

echo -n "Age :"
read age

[ $age -le 20 ] && { echo "You are not allowed"; exit 1 ;} || echo "welcome" 

echo "no secret"
