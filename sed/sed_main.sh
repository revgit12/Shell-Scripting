#!/bin/bash

# ./space.sh [file-path] [-f | --fix] [-h | --help]

usage() {
	
	echo "USAGE: $0 [file-path] [-f | --fix] [-h | --help]"
	exit 1

}



if [ $# -eq 0 ]
then 
	usage
fi

fix=0

while [ $# -gt 0 ]
do

	case $1 in
	
		"-f"|"--fix" )
			fix=1
			shift
		;;
		"-h"|"--help" )
			usage
			shift
		;;
		* )
			if [ -f "$1" ]
			then
				f=$1
				shift
			else
				usage
				shift
			fi
		;;
	esac

done

if [ $fix -eq 1 ] && [ -f "$f" ]
then
	echo "Fixing spaces at beginning and end of lines"
	sed -i 's/[[:blank:]]\+$//' "$f"
	sed -i 's/^[[:blank:]]\+//' "$f"
	
fi

if [ -f "$f" ]
then
	lines=0
	regex_start="^[[:blank:]]+"
	regex_end="[[:blank:]]+$"
	while IFS= read -r line
	do
		let lines++
		echo "$line" | sed -e '/[[:blank:]]\+$/q9' -e '/^[[:blank:]]\+/q7' >/dev/null
		if [ $? -eq 0 ]
		then
			
			printf %4s "$lines:" >> temp.txt 
			echo "$line" >> temp.txt
			continue
		fi

		printf %4s	"$lines:" >> temp.txt
		if [[ "$line" =~ $regex_start ]]
		then
			match=`echo "$BASH_REMATCH" | sed 's/\t/|__tab__|/g'`
			echo -e -n "\e[41m$match\e[49m" >> temp.txt
		fi	
		echo -e -n "$line" | sed -e 's/[[:blank:]]\+$//' -e 's/^[[:blank:]]\+//' >> temp.txt
		if [[ "$line" =~ $regex_end ]]
		then
	                match=`echo "$BASH_REMATCH" | sed 's/\t/|__tab__|/g'`
                        echo -e  "\e[41m$match\e[49m" >> temp.txt
		else
			echo >> temp.txt
		fi
	done < "$f"
cat temp.txt
rm  temp.txt
fi

if [ $fix -eq 1 ]
then
	echo
	echo -e "\e[42mDONE\e[49m"
fi
