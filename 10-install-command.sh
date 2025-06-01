#!/bin/bash
userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "ERROR: you must be root to run this script"
    exit 1
else
    echo "you can run the script"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MYSQL is not installed going to install"

    dnf install mysql -y

    if [ $? -eq 0 ]
    then
        echo "Installing Mysql is successs"
    else
        echo "Intalling mysql is failed"
        exit 1
    fi
else
    echo "MYSQL is already installed Nothing to do"
fi