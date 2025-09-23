#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelege"
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

dnf list installed mysql # install if it is not installed
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo -e "MYSQL already exist... $Y SKIPPING $N"
fi 

dnf list installed nginx # install if it is not installed
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "nginx already exist... $Y SKIPPING $N"
fi 

dnf list installed python3 # install if it is not installed
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "python3 already exist... $Y SKIPPING $N"
fi 
