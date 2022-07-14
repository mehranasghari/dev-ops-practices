#!/bin/bash

free=$(df -h / | grep / | awk '{print $4}')
total=$(df -h / | grep / | awk '{print $2}')
percent=$(df -h / | grep / | awk '{print $5}' | sed 's/%//g')

echo "Free/Total memory: $free / $total"
echo "Percentage: $percent"