#!/bin/bash

#Filename: success_test.sh


# Evaluate the arguments on the command line - ie success_test.sh 'ls | grep txt'


eval $@


if [ $? -eq 0 ];


then


 echo "$CMD executed successfully"


else


 echo "$CMD terminated unsuccessfully"


fi
