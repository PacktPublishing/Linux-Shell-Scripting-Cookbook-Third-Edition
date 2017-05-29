#/bin/bash

#filename: generate_checksums.sh

PIDARRAY=()

for file in File1.iso File2.iso

do

md5sum $file &

PIDARRAY+=("$!")

done

wait ${PIDARRAY[@]}
