#!/bin/bash

LEADERS=("Modi" "trump" "putin" "hareesh")

echo "All Leaders: ${LEADERS[@]}"
echo "First Leader: ${LEADERS[0]}" 

# here why we given 0 is index of 0 is modi so 
# size =4 & Max index =3 and starts with 0
# if we ask 10 index it will not show 

echo "Tenth Leader: ${LEADERS[10]}"
