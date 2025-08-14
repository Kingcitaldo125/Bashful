#!/bin/bash
# Art collector greps the 'FROM' lines in Dockerfiles in a specified directory
# and tries to pull down the corresponding images.
# Some images come from either custom registries, or are not associated
# with a registry docker has access to by default. These image pulls are skipped.

floc=$1

if [ "$floc" == "" ];
then
    echo "Must specify a location to search."
    exit 1
fi

which docker &>/dev/null
rc=`echo $?`

if [[ $rc -ne 0 ]];
then
    echo "Need docker installed in order to pull images."
    exit $rc
fi

dockerfiles=$(find $floc -type f | grep Dockerfile)

# Collect all of the image names from the dockerfiles in the specified directory
declare -a images
while IFS= read -r line;
do
    limages=`cat $line | grep -E "^FROM\b" | awk '{ print $2 }'`

    # Go through the listing of images for this Dockerfile
    while IFS= read -r img;
    do
        has_img=$(echo "${images[@]}" | grep "$img")

        if [ "$has_img" != "" ];
        then
            continue
        fi

        images+=("$img")
    done <<< "$limages"
done <<< "$dockerfiles"

# Try to pull down the images
for img in "${images[@]}"
do
    docker pull $img &>/dev/null
    rc=`echo $?`

    if [[ $rc -eq 0 ]];
    then
        echo "Pulled image '${img}' successfully."
    fi

    sleep 1
done

exit 0
