#!/bin/bash

########################################################################
# Author: 		Robson Kalata Nazareth
# Description: 	Use the output of nmap to print a table with ip and mac
#			   	addresses and device manufacturer.
# Usage: 		./host_discover.sh
#		 		./host_discover.sh 192.168.1.0/24
#		 		./host_discover.sh 192.168.1.1-30
########################################################################

LGRAY='\033[0;37m'
DGRAY='\033[1;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No ColorNC='\033[0m' # No Color

#ip_range="192.168.15.1-30"
if [ -z $1 ]; then
	read -p "Enter IP range (e.g., 192.168.1.0/24 or 192.168.1.1-20): " ip_range
else
	ip_range=$1
fi

echo -e "${DGRAY}Running: ${LGRAY}nmap -sn $ip_range$NC"
out=`sudo nmap -sn $ip_range`

declare -a mac_array
declare -a ip_array
declare -a device_array
mac_n=1
ip_n=1
mac_router=true

while IFS= read -r line;
do
	# Get router ip address
	line1=`echo $line | grep -P "\(\d{1,3}(\.\d{1,3}){3}\)"`
	if [ "$line1" ]; then
		if [[ $line1 =~ ([0-9]{1,3}(\.[0-9]{1,3}){3}) ]]; then
			ip=${BASH_REMATCH[1]}
			ip_array[$ip_n]=$ip
			((ip_n++))
		fi
	# Get router mac address
	elif [ "$(echo ${line:0:3})" = "MAC" ] && $mac_router; then
		if [[ $line =~ ([0-9A-F]{2}(:[0-9A-F]{2}){5}).*(\(.*\))$ ]]; then
			mac=${BASH_REMATCH[1]}
			device=${BASH_REMATCH[3]}
			mac_array[$mac_n]=$mac
			device_array[$mac_n]=$device
			((mac_n++))
		fi
		mac_router=false
	# Get connected devices ip and mac addresses
	else
		line=`echo $line | grep -P "(\d{1,3}(\.\d{1,3}){3}|\w\w(:\w\w){5})"`
		if [ "`echo ${line:0:3}`" = "MAC" ]; then
			mac_array[$mac_n]=${line:13:17}
			device_array[$mac_n]=${line:31}
			((mac_n++))
		elif [ "`echo ${line:0:4}`" = "Nmap" ]; then
			ip_array[$ip_n]=${line:21}
			((ip_n++))
		fi
	fi
done <<< $out

# Print table
echo -e "${GREEN}---------------------------------------------------------------------------------"
echo "| MAC Address       | IP Address    | Device"
echo -e "---------------------------------------------------------------------------------$NC"

for ((i=1; i<=${#mac_array[@]}; i++))
do
	#echo $i
	if [ "`echo ${ip_array[$i]:12:1}`" = "" ]; then
		echo "| ${mac_array[$i]} | ${ip_array[$i]}  | ${device_array[$i]}"
	else
		echo "| ${mac_array[$i]} | ${ip_array[$i]} | ${device_array[$i]}"
	fi
done

echo -e "${GREEN}---------------------------------------------------------------------------------$NC"
