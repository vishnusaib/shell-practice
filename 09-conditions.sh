#!/bin/bash
# This script demonstrates the use of If conditional statements in bash.
num=$1
echo "Entered number: $num"

if [ $num -lt 100 ];
then
    echo "Entered number is less than 100"
else
    echo "Entered number is greater than 100"
fi
# This script demonstrates the use of If conditional statements in bash.