data="name,gender
,rollno,location"

# To read each of the item in a variable, we can use IFS.


oldIFS=$IFS


IFS=, # IFS is now a ,


for item in $data;


do


 echo Item: $item


done

IFS=$oldIFS
