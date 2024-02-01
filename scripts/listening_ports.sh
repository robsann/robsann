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
p=6                             # for space formatting
k=1                             # field number
line="| "                       # aggregate fields

sudo echo ""
echo -e "${GREEN}--------------------------------------------------------------------------------------------------------"
# Formate and print the header
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
k=1         # field number
#port=0
line="| "

echo -e "--------------------------------------------------------------------------------------------------------${NC}"
# Formate and print the body
body=`sudo ss -lntp | grep -v "State" | awk '{$5=$5$6;}{print $1,$4,$5}' | sort -rnk 2`
for field in $body;
do
    n=$((field_size[field_n]-${#field}))
    for i in `seq 1 $n`
    do
        if [ $k -eq 2 ]; then
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
        else
            field="$field "
        fi
    done
    field="$field|"
    p=6
    if [ `echo $field | grep pid | wc -l` -eq 1 ]; then
        if [[ $field =~ (.*)users:\(\(\"(.*)\",pid=([0-9]+), ]]; then
            fields[1]=${BASH_REMATCH[1]}    # peer address
            fields[2]=${BASH_REMATCH[2]}    # process
            fields[4]=${BASH_REMATCH[3]}    # pid
            fields[3]=`ps aux | grep ${fields[4]} | head -1 | awk '{print $1}'`
            for j in `seq 1 4`
            do
                n=$((field_size[field_n]-${#fields[j]}))
                m=4
                for i in `seq 1 $n`
                do
                    if [ $j -eq 1 ]; then
                        if [ $m -gt 0 ]; then
                            fields[j]="${fields[j]} "
                            ((m--))
                        else
                            fields[j]=" ${fields[j]}"
                        fi
                    else
                        fields[j]+=" "
                    fi
                done
                fields[j]+="| "
                ((field_n++))
            done
            line="$line${fields[1]}${fields[2]}${fields[3]}${fields[4]}"
        fi
    else
        line="$line$field "
    fi
    if [ $((k%3)) -eq 0 ]; then
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
