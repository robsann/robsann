#!/bin/bash

########################################################################
# Description:  Use the output of ps to print a table with the top n cpu
#               and memory usage.
# Usage:        ./mem_and_cpu_usage.sh
#               ./mem_and_cpu_usage.sh 5
########################################################################

BWHITE='\033[1;37m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No ColorNC='\033[0m' # No Color

if [ -z $1 ]; then
	read -p "Enter the number of process to show: " num
else
	num=$1
fi

while true
do

field_size=(7 8 5 5 6 1)		# for spacing formatting
field_n=0						# for spacing formatting

echo ""

# 3: order by cpu; 4: order by memory
for l in `seq 3 4`;
do
    if [ $l -eq 3 ]; then
        echo -e "${BWHITE}Top $num CPU usage$NC"
        echo -e "$GREEN-------------------------------------------------------------------------$NC"
    else
        echo ""
        echo -e "${BWHITE}Top $num Memory usage$NC"
        echo -e "$GREEN-------------------------------------------------------------------------$NC"
    fi
    k=1							# field counter
    line=""						# aggregate fields

    # Get header and body from ps output
    header=$(ps aux | awk '{print $1,$2,$3,$4,$6,$11}' | head -1)
    body=$(ps aux | awk '{$6=$6/(1024*1024)"G";}{print $1,$2,$3,$4,$6=sprintf("%.2f",$6)"G",$11}' | sort -rnk $l | head -n $(($num+1)) | grep -v ps | head -n $num)

    # Loop field by field
    for field in $header $body;
    do
        # Format field
        n=$((${field_size[field_n]}-${#field}))
        if [ $n -gt 0 ]; then
            for i in `seq 1 $n`
            do
                field="$field "
            done
            field="$field|"
        fi
        line="$line$field "
        # Print field
        if [ $((k%6)) -eq 0 ]; then
            # Print line after go over the header fields
            if [ $k -eq 6 ]; then
                echo -e "$GREEN$line$NC"
                echo -e "$GREEN-------------------------------------------------------------------------$NC"
            # Print fields
            else
                echo "$line"
            fi
            line=""
        fi
		# Counters
        if [ $(((field_n+1)%6)) -eq 0 ]; then
            field_n=0
        else
            ((field_n++))
        fi
        ((k++))
    done
    echo -e "$GREEN-------------------------------------------------------------------------$NC"
done

sleep 5
done
