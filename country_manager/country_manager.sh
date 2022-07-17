#!/bin/bash

if [[ $# -lt 2 ]]; then
    echo "not enough arguments"
    exit 1
fi

if [[ "$1" != "block" && "$1" != "unblock" ]]; then
    echo "invalid command"
    exit 1
fi

if [[ ! -e $2 ]]; then
    echo "file not found"
    exit 1
fi

case $1 in
    block)
        while read line || [ -n "$line" ]; do
        
            # line_number=$(iptables -L | grep $line | grep ACCEPT | cut -d " " -f 1)
            # if [[ $? -eq 0 ]]; then
            #     iptables -D $line_number  
            # fi

            iptables -I INPUT -s $line -j DROP

        done < $2
        ;;
    unblock)
        while read line || [ -n "$line" ]; do

            # line_number=$(iptables -L | grep $line | grep ACCEPT | cut -d " " -f 1)
            # if [[ $? -eq 0 ]]; then
            #         iptables -D $line_number
            # fi
            iptables -D INPUT -s $line -j ACCEPT
        done < $2
        ;;
esac
