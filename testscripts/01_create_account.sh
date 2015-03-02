# curl requests: create new account

APIKEY=pixie
SECRET=dust
KB=http://127.0.0.1:8080/1.0/kb
EXKEY=chocolate

# create tenant
curl -v \
  -X POST \
  -u admin:password \
  -H 'Content-Type: application/json' \
  -H 'X-Killbill-CreatedBy: admin' \
  -d '{"apiKey": "'$APIKEY'", "apiSecret": "'$SECRET'"}' \
  "$KB/tenants"

# get my tenant
curl -u admin:password \
  -H "X-Killbill-ApiKey: $APIKEY" \
  -H "X-Killbill-ApiSecret: $SECRET" \
  $KB/tenants?apiKey=$APIKEY

# create account on tenant
curl -v \
  -u admin:password \
  -H "X-Killbill-ApiKey: $APIKEY" \
  -H "X-Killbill-ApiSecret: $SECRET" \
  -H "Content-Type: application/json" \
  -H "X-Killbill-CreatedBy: curl" \
  -X POST \
  --data-binary '{
    "name":"Joe Isuzu",
    "email":"joe@isuzu.com",
    "externalKey":"'$EXKEY'",
    "currency":"USD"
  }' "$KB/accounts"

# get account
curl -u admin:password \
  -H "X-Killbill-ApiKey: $APIKEY" \
  -H "X-Killbill-ApiSecret: $SECRET" \
  $KB/accounts?externalKey=$EXKEY