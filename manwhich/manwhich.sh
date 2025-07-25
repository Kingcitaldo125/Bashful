#!/bin/bash

tofind=$1

if [ "$tofind" == "" ];
then
    exit 1
fi

string=`echo $PATH`
IFS=':' read -r -a array <<< "$string"

for path in "${array[@]}";
do
    find $path -name $tofind -executable
done

exit 0
