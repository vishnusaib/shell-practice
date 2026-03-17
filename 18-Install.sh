#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "your not root user"
else
    echo "Hi Root User"
fi