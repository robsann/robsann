#!/bin/bash

########################################################################
# Description:  Use the output of ss and ps to print a table with the
#               listening ports.
# Usage:        ./listening_ports.sh
########################################################################

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No ColorNC='\033[0m' # No Color

field_size=(8 28 18 17 12 8)    # for spacing formatting
field_n=0                       # for spacing formatting
p=6                             # for spacing formatting
k=1                             # field number
line="| "                       # aggregate fields

sudo echo ""
echo -e "${GREEN}--------------------------------------------------------------------------------------------------------"
# Format and print the header
header=`sudo ss -lntp | head -1`
header+="User PID"
if [[ $header =~ (State).*(Local Address:Port).*(Peer Address:Port)(Process).*(User).*(PID) ]]; then
    for i in `seq 1 6`;
    do
        field=${BASH_REMATCH[i]}
        n=$((field_size[$field_n]-${#field}))
        if [ $n -gt 0 ]; then
            for j in `seq 1 $n`
            do
                if [ $k -eq 2 ]; then
                    m=$(($p-4))
                    if [ $m -gt 0 ]; then
                        field="$field "
                        ((p--))
                    else
                        field=" $field"
                    fi
                else
                    field="$field "
                fi
            done
            field="$field|"
        fi
        line="$line$field "
        if [ $(((field_n+1)%6)) -eq 0 ]; then
            field_n=0
        else
            ((field_n++))
        fi
        ((k++))
    done
    echo "$line"
fi

field_n=0   # for spacing formatting
p=6         # for spacing formatting
m=4         # for spacing formatting
k=1         # field number
#port=0
line="| "

echo -e "--------------------------------------------------------------------------------------------------------${NC}"
# Format and print the body
body=`sudo ss -lntp | grep -v "State" | awk '{print $1,$4,$5,$6}' | sort -k 4`
for field in $body;
do
    # Process first three fields
    if [ $k -lt 4 ]; then
        n=$((field_size[field_n]-${#field}))
        for i in `seq 1 $n`
        do
            # Format first field
            if [ $k -eq 1 ]; then
                field="$field "
            # Format second field
            elif [ $k -eq 2 ]; then
                if [[ $field =~ .*:([0-9]+$) ]]; then
                    port=${BASH_REMATCH[1]}
                fi
                m=$(($p-${#port}))
                if [ $m -gt 0 ]; then
                    field="$field "
                    ((p--))
                else
                    field=" $field"
                fi
            # Format third field
            else
                if [ $m -gt 0 ]; then
                    field="$field "
                    ((m--))
                else
                    field=" $field"
                fi
            fi
        done
        line="$line$field| "
        p=6
        m=4
    # Process fourth field
    else
        # Extract process, pid, and user
        if [[ $field =~ users:\(\(\"(.*)\",pid=([0-9]+), ]]; then
            fields[1]=${BASH_REMATCH[1]}    # process
            fields[3]=${BASH_REMATCH[2]}    # pid
            # Extract user from ps output using pid
            fields[2]=`ps aux | grep ${fields[3]} | head -1 | awk '{print $1}'`
            # Format fields
            for j in `seq 1 3`
            do
                n=$((field_size[field_n]-${#fields[j]}))
                for i in `seq 1 $n`
                do
                    fields[j]+=" "
                done
                fields[j]+="| "
                ((field_n++))
            done
            line="$line${fields[1]}${fields[2]}${fields[3]}"
        fi
    fi
    # Counters reset
    if [ $((k%4)) -eq 0 ]; then
        echo "$line"
        line="| "
        k=1
    else
        ((k++))
    fi
    if [ $(((field_n+1)%7)) -eq 0 ]; then
        field_n=0
    else
        ((field_n++))
    fi
done

echo -e "${GREEN}--------------------------------------------------------------------------------------------------------${NC}"
