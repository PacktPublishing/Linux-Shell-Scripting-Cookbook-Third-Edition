#!/bin/bash


case $1 in


 init )


 cmd="CREATE TABLE address \


 (name string, phone string, email string);" ;;
query )


 cmd="SELECT name, phone, email FROM address \


 WHERE $2 LIKE '$3';";;insert )


 cmd="INSERT INTO address (name, phone, email) \


 VALUES ( '$2', '$3', '$4' );";;

esac


# Send the command to sqlite3 and reformat the output


 echo $cmd | sqlite3 $HOME/addr.db | sed 's/|/\n/g'

