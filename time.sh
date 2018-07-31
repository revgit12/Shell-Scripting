#!/bin/bash

START=$(date +%s)
CURRENT_DIR=$(pwd)
sleep 2
END=$(date +%s)


DIFFERENCE=$(( END - START ))

echo
echo "Start Time:$START , END Time:$END"
echo "Time Elapsed:$DIFFERENCE"
