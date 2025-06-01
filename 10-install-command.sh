#!/bin/bash
userid=$(id -u)

if [ userid -ne 0 ]
then
    echo "error: you must be root to run this script"
    exit 1
else
    echo "you can run the script"
fi

dnf list installed mysql
