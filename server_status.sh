#!/bin/bash

while read line || [ -n "$line" ]; do
    server=(${line[@]})
    if [[ ${server[1]} -ge 50 && ${server[2]} -ge 50 && ${server[3]} -ge 50 ]]; then
        echo "${server[0]}: Pass"
    else
        echo "${server[0]}: Fail"
    fi
done < $1