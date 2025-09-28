#!/bin/bash

echo "Please enter the Number:"
read NUMBER
if [ $NUMBER -lt 2 ]; then
    echo "$NUMBER is not a prime number."
    exit 0
fi

i=2
while [ $i -lt $NUMBER ]; do
    if [ $((NUMBER % i))] -eq 0 ]; then
        echo " $NUMBER is not a prime number"
        exit 0
    fi
done

echo "$NUMBER is a prime number"

