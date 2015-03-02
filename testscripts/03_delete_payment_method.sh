# curl requests: delete payment method

APIKEY=pixie
SECRET=dust
KB=http://127.0.0.1:8080/1.0/kb
PAYMENTID=36dc77f6-ad6e-4746-ae11-5c0f562d5684

# delete payment method
curl -v \
  -X DELETE \
  -u admin:password \
  -H "X-Killbill-ApiKey: $APIKEY" \
  -H "X-Killbill-ApiSecret: $SECRET" \
  -H "Content-Type: application/json" \
  -H "X-Killbill-CreatedBy: curl" \
  "$KB/paymentMethods/$PAYMENTID"