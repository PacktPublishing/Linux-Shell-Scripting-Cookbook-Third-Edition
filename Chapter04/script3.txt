egrep -o "\b[[:alpha:]]+\b" $filename | tr [A=Z] [a-z] | \

awk '{ count[$0]++ }

END{ printf("%-14s%s\n","Word","Count") ;

for(ind in count)

{ printf("%-14s%d\n",ind,count[ind]);
 }
 }' | sort

