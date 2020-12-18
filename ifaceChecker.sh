#!/bin/bash

#simple test script to see if we have internet connectivity
#searches for available interfaces
#user input dictates which interface is being tested


#declaring array
declare -a interface

#fetching available interfaces  and printing them 
interface=()
j=0 #incrementer variable
for iface in $(ifconfig | awk '$1 ~ ":" { print $1 }' | cut -d ':' -f1); do
	printf "interface $j : $iface \n"
	interface+=("$iface")
	let j+=1
done

#user input
echo -n "select a interface by typing interface number : "
read interfacenumber

#check if input interface is up
interfaceUp=$(cat /sys/class/net/"${interface[$interfacenumber]}"/operstate)
if [ "$interfaceUp" == down  ]; then
	echo "${interface[$interfacenumber]} is down"
elif [ "$interfaceUp" == up ]; then
	echo "${interface[$interfacenumber]} is up"
elif [ "$interfaceUp" == unknown ]; then
	echo "${interface[$interfacenumber]} is in unknown state"
else
	echo "something went wrong ..."
fi




