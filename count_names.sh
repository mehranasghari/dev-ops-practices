#!/bin/bash

text=$(sed "s/[^[:alpha:]]/ /g" $1)

count=0

for name in $text; do
    count=$((count+1))
done

echo "Count: $count"