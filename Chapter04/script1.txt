#!/bin/bash

#Filename: silent_grep.sh

#Desc: Testing whether a file contain a text or not
 
if [ $# -ne 2 ]; then

echo "Usage: $0 match_text filename"

exit 1

fi



match_text=$1
filename=$2

grep -q "$match_text" $filename


if [ $? -eq 0 ]; then

echo "The text exists in the file"

else

echo "Text does not exist in the file"

fi
