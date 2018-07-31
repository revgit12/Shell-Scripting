#!/bin/bash

if [ $# -ne 2  ]
then
echo "Two arguments needed"
exit 1
fi

A=$1
B=$2

let R=A*B

if [ $? -ne 0  ]
then
echo "Enter two numbers"
exit 2
else
echo "Result: $R"
fi
