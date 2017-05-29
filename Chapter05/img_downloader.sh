#!/bin/bash
#Filename: img_downloader.sh

if [ $# -ne 3 ];
then
 echo "Usage: $0 URL -d DIRECTORY"
 exit -1
fi

while [ $# -gt 0 ]
do
 case $1 in
 -d) shift; directory=$1; shift;;
 *) url=$1; shift;;
 esac
done

echo "URL: $url"
echo "DIR: $directory"

mkdir -p $directory;
baseurl=$(echo $url | egrep -o "https?://[a-z.\-]+")
echo Downloading $url
curl -s $url | egrep -o "<img src=[^>]*>" | 
sed 's/<img src=\"\([^"]*\).*/\1/g' |
sed "s,^/,$baseurl/," > /tmp/$$.list
cd $directory;
while read filename;
do
 echo Downloading $filename
 curl -s -O "$filename" --silent
done < /tmp/$$.list
