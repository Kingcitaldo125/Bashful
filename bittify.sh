#!/bin/bash

scripts=`find . -type f | grep -E "\.sh$"`

while IFS='' read -r item;
do
    chmod +x $item
done <<< "${scripts}"
