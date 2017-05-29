#!/bin/bash

#Filename: ftp.sh

#Automated FTP transfer

HOST='example.com'

USER='foo'

PASSWD='password'

lftp -i -n -u ${USER}:${PASSWD} $HOST <<EOF

user ${USER} ${PASSWD}

binary

cd /home/foo

put testfile.jpg


quit

EOF
