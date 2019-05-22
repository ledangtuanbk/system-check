echo "`date` start "
echo "emails $1"
echo "title $2"
echo "content $3"
curl --header "Content-Type: application/json" \
  --request POST \
  --data "{\"email\":{\"title\":\"$2\",\"content\":\"$3\",\"emails\":\"$1\"}}"\
  http://ssh.isofh.com:9463/email/send
echo "`date` end"

