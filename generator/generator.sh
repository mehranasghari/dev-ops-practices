#!/bin/bash

mkdir -p out

for i in $(seq 1 $1); do
    touch out/output$i.txt
done

for i in $(seq 1 $1); do


    count=0
    while read line || [ -n "$line" ]; do
        
        if [[ $(($count%2)) -eq 0 ]]; then
            input1=${line}
            count=$((count+1))
        else
            input2=${line}
            count=$((count+1))
        fi


        if [[ $count -eq 2 ]]; then
            echo -e "$input1\n$input2" | python3 main.py > out/output$i.txt
        fi

    done < ./in/input${i}.txt

done
