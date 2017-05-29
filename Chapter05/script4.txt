#!/bin/bash

#Filename: generate_album.sh


#Description: Create a photo album using images in current directory

echo "Creating album.."

mkdir -p thumbs


cat <<EOF1 > index.html


<html>


<head>


<style>


body
 
{
 

width:470px;

 
margin:auto;

 
border: 1px dashed grey;

 
padding:10px;
 

}
 
img

{
 

margin:5px;


 border: 1px solid black;

}
 
</style>


</head>


<body>


<center><h1> #Album title </h1></center>


<p>


EOF1


for img in *.jpg;

do
 

convert "$img" -resize "100x" "thumbs/$img"


echo "<a href=\"$img\" >
" >>index.html

echo "
<img src=\"thumbs/$img\" title=\"$img\" /></a>" >> index.html


done

cat <<EOF2 >> index.html

</p>

</body>

</html>


EOF2


echo Album generated to index.html
