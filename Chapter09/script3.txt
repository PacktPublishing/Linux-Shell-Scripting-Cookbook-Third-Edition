#!/bin/bash


#Description: Monitor disk usage health for remote systems


logfile="diskusage.log"


if [[ -n $1 ]]


then


 logfile=$1


fi


 # Use the environment variable or modify this to a hardcoded value


user=$USER


#provide the list of remote machine IP addresses
 

IP_LIST="127.0.0.1 0.0.0.0"

IP_LIST="192.168.1.2"


# Or collect them at runtime with nmap


# IP_LIST=`nmap -sn 192.168.1.2-255 | grep scan | grep cut -c22-`


if [ ! -e $logfile ]


then


 printf "%-8s %-14s %-9s %-8s %-6s %-6s %-6s %s\n" \
 "Date" "IP address" "Device" "Capacity" "Used" "Free" \ 
"Percent" "Status" > $logfile


fi


 (


for ip in $IP_LIST;


do


 ssh $user@$ip 'df -H' | grep ^/dev/ > /tmp/$$.df


 while read line;


 do


 cur_date=$(date +%D)


 printf "%-8s %-14s " $cur_date $ip


 echo $line | \
 awk '{ printf("%-9s %-8s %-6s %-6s %-8s"122919461 ,$1,$2,$3,$4,$5); }'


 pusg=$(echo $line | egrep -o "[0-9]+%")


 pusg=${pusg/\%/};


 if [ $pusg -lt 80 ];


 then


 echo SAFE


 else


 echo ALERT


 fi


 done< /tmp/$$.df



done


) >> $logfile
