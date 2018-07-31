#!/bin/bash

for i in *.txt
do
	date>>$i
	ps -ef|head -5 >>$i
done
