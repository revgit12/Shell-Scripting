#!/bin/bash

while [ $# -gt 0 ]
do

	case "$1" in

		"-h"|"--help" )
			echo "Usage $0 [-h] [--help] [-f file] [--file file]"
			exit 1
		;;
		"-f"|"--file" )
			file=$2
			if ! [ -f $file ]
			then
				echo "File doent exist"
				exit 2
			fi
			lines=$(cat "$file"| wc -l)
			words=$(cat "$file"| wc -w)
			char=$(cat "$file"| wc -m)			
			
			echo "=======File : $file======="
			echo "Lines: $lines"
			echo "Words: $words"
			echo "Characters: $char"
			echo "=========================="
			shift
			shift
		;;
		*)
			echo "Usage $0 [-h] [--help] [-f file] [--file file]"
                        exit 1
		;;

	esac


done
