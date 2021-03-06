#!/bin/bash

function usage() {
echo "Usage: $0 [-l location][--location location][-e extension][--extension extension][-h][--help][-s][--stats]"
echo "Examples:"
echo "$0 -l /etc -e txt -s"
exit 1
}

loc_set=0
stats=0

while [ $# -gt 0 ]
do
        case $1 in
                "-l"|"--location" )
                        loc="$2"
                        if ! [ -d "$loc" ]
                        then
                                usage
                        fi
			loc_set=1
                        shift
                        shift
                ;;
                "-e"|"--extension" )
			ext="$2"
                        shift
                        shift
                ;;
                "-s"|"--stats" )
			stats=1
                        shift
                ;;
                "-h"|"--help" )
                        shift
                        usage
                ;;
                * )
			usage
                ;;

        esac
done

if [ $loc_set -ne 1 ]
then
	loc=$(pwd)
fi

echo "Location: $loc"

if [ "$ext" != "" ]
then
	ls -l $loc | awk ' /^-/'| grep "\.$ext$" &>/dev/null
	if [ $? -ne 0 ]
	then
		echo ".$ext files not found in $loc"
		exit 2
	fi
	ls -l $loc|awk '/^-/'|grep "\.$ext$"|awk -v st=$stats -f size.awk

else
	ls -l $loc | awk '/^-/' | awk -v st=$stats -f size.awk
fi
	
