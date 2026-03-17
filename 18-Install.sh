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

dnf list installed mysql
#to get the exit status of previous cmd $?

if [ $? -ne 0 ]
then
    echo "Installing MySQL"
    dnf install mysql -y
    if [ $? -eq 1 ]
    then
        echo "Installing Mysql is successs"
        exit 1
    else
        echo "Intalling mysql is failed"
    fi
else
    echo "MySQL is already Installed"
fi