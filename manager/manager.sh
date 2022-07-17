#!/bin/bash

case $1 in
    "bonus")
        id=$2
        while read line || [ -n "$line" ]; do
            salary=$(cat employee.csv | grep $id | cut -d ',' -f 5)
            name=$(cat employee.csv | grep $id | cut -d ',' -f 3)
            if [ "$id" == $(echo $line | cut -d ',' -f 1) ]; then
                bonus=$((salary * 5 / 100))
                echo "$name will get \$$bonus bonus"
                exit 0
            fi
        done < ./employee.csv
        exit 1
        ;;
    "city")
        city=$2
        while read line || [ -n "$line" ]; do
            phone=$(echo $line | cut -d ',' -f 4)
            name=$(echo $line | cut -d ',' -f 3)
            if [ "$city" == $(echo $line | cut -d ',' -f 2) ]; then
                echo "Customer Name: $name"
                echo "Mobile No: $phone"
            fi
        done < ./employee.csv
        ;;
    *)
        echo "command not found"
        exit 1
        ;;
esac