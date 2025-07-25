#!/bin/bash

tofind=("$@")

if [ "$tofind" == "" ];
then
    exit 1
fi

string=`echo $PATH`
IFS=':' read -r -a array <<< "$string"

for item in "${tofind[@]}";
do
    for path in "${array[@]}";
    do
        find $path -name $item -executable
    done
done

exit 0
