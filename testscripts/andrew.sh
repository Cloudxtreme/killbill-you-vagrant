# test curl requests

APIKEY=andrew
KB=http://127.0.0.1:8080/1.0/kb
EXKEY=andrew-varnerin
TENKEY="3deacb77-699f-44ff-8cb5-cb80cb4d8c83" # replace on each new box/account
ACTKEY="362eaf5e-acd8-411f-825e-46186ef29113" # replace on each new box/account

# create tenant
curl -v \
  -X POST \
  -u admin:password \
  -H 'Content-Type: application/json' \
  -H 'X-Killbill-CreatedBy: admin' \
  -d '{"apiKey": "'$APIKEY'", "apiSecret": "'$APIKEY'"}' \
  "$KB/tenants"

# get my tenant
curl -u admin:password \
  -H "X-Killbill-ApiKey: $APIKEY" \
  -H "X-Killbill-ApiSecret: $APIKEY" \
  $KB/tenants?apiKey=$APIKEY

# create account on tenant
curl -v \
  -u admin:password \
  -H "X-Killbill-ApiKey: $APIKEY" \
  -H "X-Killbill-ApiSecret: $APIKEY" \
  -H "Content-Type: application/json" \
  -H "X-Killbill-CreatedBy: curl" \
  -X POST \
  --data-binary '{
    "name":"Andrew Varnerin",
    "email":"avarnerin@ngpvan.com",
    "externalKey":"'$EXKEY'",
    "currency":"USD"
  }' "$KB/accounts"

# get account
curl -u admin:password \
  -H "X-Killbill-ApiKey: $APIKEY" \
  -H "X-Killbill-ApiSecret: $APIKEY" \
  $KB/accounts?externalKey=$EXKEY

# add payment account
curl -v \
  -u admin:password \
  -H "X-Killbill-ApiKey: $APIKEY" \
  -H "X-Killbill-ApiSecret: $APIKEY" \
  -H "Content-Type: application/json" \
  -H "X-Killbill-CreatedBy: curl" \
  -X POST \
  --data-binary '{"pluginName":"__EXTERNAL_PAYMENT__","pluginInfo":{}}' \
  "$KB/accounts/$ACTKEY/paymentMethods?isDefault=true"

curl -v \
  -u admin:password \
  -H "X-Killbill-ApiKey: $APIKEY" \
  -H "X-Killbill-ApiSecret: $APIKEY" \
  -H "Content-Type: application/json" \
  -H "X-Killbill-CreatedBy: curl" \
  -X POST \
  --data-binary '{"pluginName":"killbill-stripe","pluginInfo":{}}' \
  "$KB/accounts/$ACTKEY/paymentMethods?isDefault=true"


# authorize
curl -v \
  -u admin:password \
  -H "X-Killbill-ApiKey: $APIKEY" \
  -H "X-Killbill-ApiSecret: $APIKEY" \
  -H "Content-Type: application/json" \
  -H "X-Killbill-CreatedBy: curl" \
  --data-binary '{"transactionType":"AUTHORIZE","amount":"10","currency":"USD","transactionExternalKey":"INV-001-AUTH"}' \
  "$KB/accounts/$ACTKEY/payments"

AUTHID=17b2d3dd-ccd5-47a0-82f1-984b3b92abf3

# capture
curl -v \
  -u admin:password \
  -H "X-Killbill-ApiKey: $APIKEY" \
  -H "X-Killbill-ApiSecret: $APIKEY" \
  -H "Content-Type: application/json" \
  -H "X-Killbill-CreatedBy: curl" \
  --data-binary '{"amount":"5","currency":"USD","transactionExternalKey":"INV-001-CAPTURE"}' \
  "$KB/payments/$AUTHID"

CAPTUREID=17b2d3dd-ccd5-47a0-82f1-984b3b92abf3 #thing from capture call

# view
curl -v \
  -u admin:password \
  -H "X-Killbill-ApiKey: $APIKEY" \
  -H "X-Killbill-ApiSecret: $APIKEY" \
  $KB/payments/$CAPTUREID/