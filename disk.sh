#!/bin/bash
echo "start disk `date`"
dirname=`dirname "$0"`
echo "dirname " $dirname
CURRENT=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
THRESHOLD=90

echo "Current $CURRENT"
if [ "$CURRENT" -gt "$THRESHOLD" ] ; then
echo "send email"
emails="ledangtuanbk@gmail.com"

title="disk full $CURRENT% `hostname` `curl ipinfo.io/ip` "
body="disk full"
echo "start send email $emails $title $body"

$dirname/email.sh "$emails" "$title" "$body"
$dirname/clean-docker.sh
else 
echo "not send email"
fi
echo "end disk `date`"
