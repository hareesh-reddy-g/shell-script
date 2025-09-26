#!/bin/bash

echo "All variables passed to the script: $@"
echo "All variables passed to the script: $*"
echo "echo script name: $0"
echo "current working directory: $PWD"
echo "who is running this: $USER"
echo "Home directory: $HOME"
echo "PID of this script: $$"
sleep 50 &
echo "PID of the last command in background is: $!"