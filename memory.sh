#!/bin/bash
dirname=`dirname "$0"`
#Minimum available memory limit, MB
THRESHOLD=2000

    available=$(free -m|awk '/^Mem:/{print $7}')
    total=$(free -m|awk '/^Mem:/{print $2}')
	echo "available $available/$total"
    if [ "$available" -lt "$THRESHOLD" ]
        then
	echo "bo nho thieu"
	emails="ledangtuanbk@gmail.com"
	title="Memory full $available/$total `hostname` `curl ipinfo.io/ip`"
	body="Memory full "
	$dirname/email.sh "$emails" "$title" "$body"
    else  echo "bo nho ok"
    fi
