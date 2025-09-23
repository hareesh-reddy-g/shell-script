#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shell-script"

SCRIPT_NAME=$( echo $0 | cut -d "." -f1)

LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.Log"

mkdir -p $LOGS_FOLDER
echo "script started executeed at : $(date)"

if [ $USERID -ne 0 ]; then
    echo "ERROR:: please run this sript with root privilege"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2... $R FAILURE $N"
        exit 1
    else
        echo "Installing $2... $G SUCCESS $N"
    fi
}

dnf list installed mysql &>>$LOG_FILE # install if it is not installed
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MYSQL"
else
    echo -e "MYSQL already exist... $Y SKIPPING $N"
fi 

dnf list installed nginx &>>$LOG_FILE # install if it is not installed
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginx"
else
    echo -e "nginx already exist... $Y SKIPPING $N"
fi 

dnf list installed python3 &>>$LOG_FILE # install if it is not installed
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"
else
    echo -e "python3 already exist... $Y SKIPPING $N"
fi 