echo "`date` start "
echo "emails $1"
echo "title $2"
echo "content $3"
api='db9c223c7af464ac0ab590b28d722aba-52b0ea77-622e79c7'
curl -s --user "api:$api" \
         https://api.mailgun.net/v3/sandbox8f0fc903cba14b3eac1b4358133fe9ea.mailgun.org/messages \
         -F from='LDT <ledangtuanbk@gmail.com>' \
         -F to="$1" \
         -F subject="$2" \
         -F text="$3"
echo "`date` end"

