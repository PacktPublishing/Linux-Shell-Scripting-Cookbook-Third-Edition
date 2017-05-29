#!/bin/bash
#Filename: intruder_detect.sh
#Description: Intruder reporting tool with auth.log input
AUTHLOG=/var/log/auth.log

if [[ -n $1 ]];
then
  AUTHLOG=$1
  echo Using Log file : $AUTHLOG
fi

# Collect the failed login attempts
LOG=/tmp/failed.$$.log
grep "Failed pass" $AUTHLOG > $LOG

# extract the users who failed
users=$(cat $LOG | awk '{ print $(NF-5) }' | sort | uniq)

# extract the IP Addresses of failed attempts
ip_list="$(egrep -o "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" $LOG | sort | uniq)"


printf "%-10s|%-3s|%-16s|%-33s|%s\n" "User" "Attempts" "IP address"\ "Host" "Time range"

# Loop through IPs and Users who failed.

for ip in $ip_list;
do
  for user in $users;
    do
    # Count attempts by this user from this IP

    attempts=`grep $ip $LOG | grep " $user " | wc -l`

    if [ $attempts -ne 0 ] 
    then
      first_time=`grep $ip $LOG | grep " $user " | head -1 | cut -c-16`
      time="$first_time"
      if [ $attempts -gt 1 ] 
      then
        last_time=`grep $ip $LOG | grep " $user " | tail -1 | cut -c-16`
        time="$first_time -> $last_time"
      fi
      HOST=$(host $ip 8.8.8.8 | tail -1 | awk '{ print $NF }' )
      printf "%-10s|%-3s|%-16s|%-33s|%-s\n" "$user" "$attempts" "$ip"\ "$HOST" "$time";
    fi
  done
done

rm $LOG
