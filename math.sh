#!/bin/bash

num=7

let result1=num+3

result2=$(( num + 4 ))

result3=$[ num + 5 ]

result4=`expr $num + 6`

result5=$(expr $num + 7)

result6=`echo "$num * 1.9"| bc`

echo "R1:$result1  R2:$result2  R3:$result3  R4:$result4  R5:$result5  R6:$result6"
