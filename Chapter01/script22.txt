str1="Not empty "

str2=""


if [[ -n $str1 ]] && [[ -z $str2 ]];


then


 echo str1 is nonempty and str2 is empty string.

fi
