#!/bin/bash

echo "The name of the script is: $0"

echo "number of variables passed: $#"
echo "script name: $0"
echo "present working directory: $PWD"
echo "home directory of the user who is running the script: $HOME"
echo "which user is running the script : $USER"
echo "PID of the current script: $$"
#echo "sleep 10&"
echo "PID of the last command running in background : $!"
