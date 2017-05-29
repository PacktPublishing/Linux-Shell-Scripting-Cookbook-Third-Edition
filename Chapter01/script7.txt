#!/bin/bash

#Filename: debug.sh


for i in {1..6};


do


 set -x


 echo $i


 set +x


done

echo "Script executed"
