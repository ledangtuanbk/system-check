echo "`date` start "
echo "emails $1"
echo "title $2"
echo "content $3"
api=''
if [ -z "$api" ]
then
      echo "\$api is empty"
fi
curl -s --user "api:$api" \
         https://api.mailgun.net/v3/sandbox8f0fc903cba14b3eac1b4358133fe9ea.mailgun.org/messages \
         -F from='LDT <ledangtuanbk@gmail.com>' \
         -F to="$1" \
         -F subject="$2" \
         -F text="$3"
echo "`date` end"

