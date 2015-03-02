# curl requests: add payment method

APIKEY=pixie
SECRET=dust
KB=http://127.0.0.1:8080/1.0/kb
ACTKEY=10cbc7b6-42bf-4618-90d0-7d6f4047fe62

# add payment method
curl -v \
  -u admin:password \
  -H "X-Killbill-ApiKey: $APIKEY" \
  -H "X-Killbill-ApiSecret: $SECRET" \
  -H "Content-Type: application/json" \
  -H "X-Killbill-CreatedBy: curl" \
  -X POST \
  --data-binary '{"pluginName":"__EXTERNAL_PAYMENT__","pluginInfo":{}}' \
  "$KB/accounts/$ACTKEY/paymentMethods?isDefault=true"