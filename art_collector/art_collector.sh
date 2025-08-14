#!/bin/bash

floc=$1

if [ "$floc" == "" ];
then
    echo "Must specify a location to search."
    exit 1
fi

dockerfiles=$(find . | grep Dockerfile)
which docker &>/dev/null
rc=`echo $?`

if [[ $rc -ne 0 ]];
then
    echo "Need docker installed in order to pull images."
    exit $rc
fi

for itm in $dockerfiles
do
    img=`cat $itm | grep "FROM" | awk '{ print $1 }'`

    # Try to pull down the image
    docker pull $img &>/dev/null
    rc=`echo $?`

    if [[ $rc -eq 0 ]];
    then
        echo "Pulled image '${img}' successfully."
    fi

    sleep 1
done

exit 0
