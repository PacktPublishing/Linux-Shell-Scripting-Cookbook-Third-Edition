#!/bin/bash


#Desc: Script to track changes to webpage


if [ $# -ne 1 ];


then
 

 echo -e "$Usage: $0 URL\n"


 exit 1;


fi


first_time=0


# Not first time


if [ ! -e "last.html" ];


then


 first_time=1


 # Set it is first time run


fi


curl --silent $1 -o recent.html


if [ $first_time -ne 1 ];


then


 changes=$(diff -u last.html recent.html)


 if [ -n "$changes" ];


 then


 echo -e "Changes:\n"


 echo "$changes"


 else


 echo -e "\nWebsite has no changes"


 fi


else


 echo "[First run] Archiving.."


fi


cp recent.html last.html
