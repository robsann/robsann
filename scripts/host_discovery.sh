#!/bin/bash

########################################################################
# Description: 	Use the output of nmap to print a table with ip and mac
#				addresses and device manufacturer.
# Usage: 		./host_discover.sh
#				./host_discover.sh 192.168.1.0/24
#				./host_discover.sh 192.168.1.1-30
########################################################################

BWHITE='\033[1;37m'
LGRAY='\033[0;37m'
DGRAY='\033[1;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No ColorNC='\033[0m' # No Color

if [ -z $1 ]; then
	read -p "Enter IP range (format: 192.168.1.0/24 or 192.168.1.1-20): " ip_range
else
	ip_range=$1
fi

echo -e "${DGRAY}Running: ${LGRAY}nmap -sn $ip_range$NC"
out=`sudo nmap -sn $ip_range`

declare -a mac_array		# mac address array
declare -a ip_array		# ip address array
declare -a device_array		# manufacture name array
mac_n=1				# mac counter
ip_n=1				# ip counter
mac_router=true			# router boolean

while IFS= read -r line;
do
	# Get connected devices ip and mac addresses
	# line=`echo $line | grep -P "(\d{1,3}(\.\d{1,3}){3}|[0-9A-F]{2}(:[0-9A-F]{2}){5})"`
	if [ "${line:0:9}" = "Nmap scan" ]; then
		if [[ $line =~ ([0-9]{1,3}(\.[0-9]{1,3}){3}) ]]; then
			ip=${BASH_REMATCH[1]}			# ip address
			ip_array[$ip_n]=$ip
			((ip_n++))
		fi
	elif [ "$line" = "Host is up." ]; then
		line_host=$(ip a | grep "192.168.15.11" -B 1 | grep -P "link")
		if [[ $line_host =~ ([0-9a-f]{2}(:[0-9a-f]{2}){5}) ]]; then
			mac_array[$mac_n]=${BASH_REMATCH[1]}
			((mac_n++))
		fi
	elif [ "${line:0:3}" = "MAC" ]; then
		if [[ $line =~ ([0-9A-F]{2}(:[0-9A-F]{2}){5}).*(\(.*\))$ ]]; then
			mac=${BASH_REMATCH[1]}			# mac address
			device=${BASH_REMATCH[3]}		# device manufacturer
			mac_array[$mac_n]=$mac
			device_array[$mac_n]=$device
			((mac_n++))
		fi
	elif [ "${line:0:10}" = "Nmap done:" ]; then
		if [[ $line =~ \((.*)\) ]]; then
			hosts_up=${BASH_REMATCH[1]}		# number of hosts up
		fi
	fi
done <<< $out

# Add host ip address
ip_array[$ip_n]=$(echo $ip_range | sed -E 's/(.*)\..*/\1/g')
((ip_n++))
# Add host mac address
net=$(echo $ip_range | sed -E 's/(.*)\..*/\1/g')
line=$(ip a | grep "$net" -B 1 | head -n 1)
mac_array[$mac_n]=$(echo $line | sed -E 's/.*\s([0-9a-f:]+)\s.*/\1/g')
# Add device name
device_array[$mac_n]=$(hostname)
((mac_n++))

# Print table
echo -e $BWHITE$hosts_up$NC
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
