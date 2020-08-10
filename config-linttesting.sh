#!/bin/bash

#filename='log.txt'


#if grep -Rw 'log.txt' -e 'FAILURE'
#then
#                 printf "I found 'FAILURE' word in LOG"
#                     fi

grep "FAILURE" log.txt | awk -F ":" '{print $1" " $2" "  $3" "  $4}'
