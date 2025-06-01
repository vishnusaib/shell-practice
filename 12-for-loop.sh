#!/biin/bash

#for i in {1..10}
#do
#    echo $i
#done

#!/bin/bash

userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script.logs"
SCRIPT_NAME=$(echo $0 | cut -d '.' -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "python3" "nginx" "httpd")

mkdir -p $LOGS_FOLDER
echo "Script Started executing at $(date)" | tee -a $LOG_FILE

if [ $userid -ne 0 ]
then
    echo -e "$R ERROR: Please run this script with root access $N" | tee -a $LOG_FILE
    exit 1
else
    echo -e "$G you are running with root access $N" | tee -a $LOG_FILE
fi
# validate functions takes input as exit status, what command they tried to install
VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "$G Installing $2 is Success" | tee -a $LOG_FILE
    else
        echo -e "$R Installion $2 is Failure" | tee -a $LOG_FILE
        exit 1
    fi
}

for package in ${PACKAGES[@]}
do
    dnf list installed $package &>>LOG_FILE
    if [ $? -ne 0 ]
    then
        echo -e "$Y $package is not installed going to install it $N" | tee -a $LOG_FILE
        dnf install $package -y &>> $LOG_FILE
        VALIDATE $? "$package"
    else
        echo -e "$G $package is already installed nothing to do $N" | tee -a $LOG_FILE
    fi
done
