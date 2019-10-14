echo "$(date) start checking disk "
dirname=$(dirname $0)
echo "dirname " $dirname
SERVER=125.212.249.214
PORT=160
nc -z -v -w2 $SERVER $PORT
result1=$?

#Do whatever you want

if [  "$result1" != 0 ]; then
  echo  "port $PORT is closed"
  echo "send email"
  emails="ledangtuanbk@gmail.com"

  title="port $PORT in $SERVER is closed  $(hostname) $(curl ipinfo.io/ip) "
  body="Port is closed"
  personal="ISOFH SYSTEM"
  echo "start send email $emails $title $body"
  $dirname/email.sh "$emails" "$title" "$body" "$personal"
else
  echo "port $PORT is open"
fi
