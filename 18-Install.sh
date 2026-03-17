#!/bin/bash

# you run this file as sudo before running in shell 
userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "your're not root user"
    exit 1
else
    echo "Hi Root User"
fi

dnf install mysql -y

#to get the exit status of previous cmd $?

if [ $? -eq 0 ]
then
    echo "My SQL is installing"
else
    echo "My SQl is not installing"
    exit 1
fi