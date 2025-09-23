#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]; then
    echo "ERROPR:: Please run this script with root privelege"
fi
dnf install mysql -y

if [ $? -ne 0]; then
    echo "ERROPR::Installing MYSQL is failure"
else
    echo "Installing MYSQL is SUCCESS"
fi