#!/bin/bash
# Address book is a script that helps exemplify various bash commands and bash syntax

filename="records.txt"

if [ ! -f "$filename" ]
then
    touch $filename
fi

print_prompt(){
    echo "--------------------"
    echo "OPTIONS:"
    echo "1. Add Record"
    echo "2. Remove Record"
    echo "3. Edit Record"
    echo "4. Get Record"
    echo "5. Quit"
    echo "--------------------"
}

get_record(){
    name=$1
    cat $filename | grep -i $name
}

write_record(){
    name=$1
    surname=$2
    email=$3
    phone=$4

    mstring="$name;$surname;$email;$phone"
    echo $mstring >> $filename
    echo "wrote record $mstring"
}

add_record(){
    name=""
    surname=""
    email=""
    phone=""

    echo "Enter Name:"
    read name

    echo "Enter Surname:"
    read surname

    echo "Enter Email:"
    read email

    echo "Enter Phone:"
    read phone

    write_record $name $surname $email $phone
}

remove_record(){
    echo "Removing record"

    surname=""
    echo "Enter Surname:"
    read surname

    items=$(cat $filename)

    touch n_records.txt
    for i in $items
    do
       msurname=$(echo $i | awk -F ';' '{ print $2 }')
       mgrep=$(echo "$msurname" | grep "$surname")

        if [ -z "$mgrep" ]
        then
            echo "$i" >>n_records.txt
        else
            echo "Removing record: $i"
        fi
    done

    >$filename
    cat n_records.txt >>$filename
    rm n_records.txt
}

print_prompt

while read minput
do
    if [ "$minput" -eq "1" ]
    then
        add_record
    elif [ "$minput" -eq "2" ]
    then
        remove_record
    elif [ "$minput" -eq "3" ]
    then
        echo "3"
    elif [ "$minput" -eq "4" ]
    then
        echo "4"
    elif [ "$minput" -eq "5" ]
    then
        break
    fi

    print_prompt

done

echo "Done."
