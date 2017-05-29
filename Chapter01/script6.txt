#!/bin/bash

#Filename: sleep.sh


echo Count:


tput sc




# Loop for 40 seconds


for count in `seq 0 40`


do


 tput rc


 tput ed


 echo -n $count


 sleep 1


done
