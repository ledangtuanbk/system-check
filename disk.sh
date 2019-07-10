#!/bin/bash
echo "$(date) start checking disk "
dirname=$(dirname $0)
echo "dirname " $dirname
CURRENT=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
THRESHOLD=90

echo "Current $CURRENT"
if [ "$CURRENT" -gt "$THRESHOLD" ] ; then
echo "send email"
emails="ledangtuanbk@gmail.com"

title="disk full $CURRENT% $(hostname) $(curl ipinfo.io/ip) "
body="disk full"
personal="ISOFH SYSTEM"
echo "start send email $emails $title $body"

$dirname/email.sh "$emails" "$title" "$body" "$personal"
$dirname/clean-docker.sh
else 
echo "not send email"
fi
echo "$(date) end disk"
