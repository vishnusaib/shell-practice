#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/roboshop-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS={3:-14}

mkdir -p $LOG_FOLDER

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: Please run this script with root access $N" | tee -a $LOG_FILE
    exit 1 #give other than 0 upto 127
else
    echo "You are running with root access" | tee -a $LOG_FILE
fi

# validate functions takes input as exit status, what command they tried to install
VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "$2 is ... $G SUCCESS $N" | tee -a $LOG_FILE
    else
        echo -e "$2 is ... $R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    fi
}
# From here till line 55 this is validations to check the execution code is correct or not
# Checking user is Providing correct locations
USAGE(){
    echo -e "$Y USAGE $N sudo sh backup.sh <source-dir> <dest-dir> <days> optional"
    exit 1
}

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo "$R Source Dir $SOURCED_DIR does not exist.Please check $N"
    exit 1
fi

if [ ! -d $DEST_DIR ]
then
    echo "$R Dest Dir $DEST_DIR does not exist. Please check $N"
    exit 1
fi

# Checking the Files more than 14 days

dnf install zip -y

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)

if [ ! -z $FILES ]
then
    echo "Files to ZIP: $FILES"
    TIMESTAMP=$(date +%F-%H-%M-%S)
    ZIP_FILE="$DEST_DIR/app-logs-TIMESTAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime +14 | zip @ "$ZIP_FILE"
    
    if [ -f $ZIP_FILE ]
    then
        echo "Successfully Created Zip File"
        
        while IFS= read -r filepath
        do
            echo "Deleting file $filepath" | tee -a $LOG_FILE
            rm -rf $filepath
        done <<< $FILES
    
    else
        echo -e "Zip Files is Creation $R FAILURE $N"
        exit 1
else
    echo "No Files to ZIP"
fi
