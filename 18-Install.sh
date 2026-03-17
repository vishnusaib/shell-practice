#!/bin/bash

# you run this file as sudo before running in shell 
userid=$(id -u)

if [ $userid -eq 1001 ]
then
    echo "your're not root user"
    exit 1
else
    echo "Hi Root User"
fi

dnf install mysql -y
