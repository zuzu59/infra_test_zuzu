#!/bin/bash
#Petit client bash pour le zDynDNS
#zf161115.1555

while true
do
	date
	ZSTR=$(cat /etc/hostname)
	echo "s "$ZSTR" xyz" | netcat sdftests.epfl.ch 3318
	sleep $[ ( $RANDOM % 55 ) + 10 ]s
done


