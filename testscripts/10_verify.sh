# curl requests: authorize and void payment

APIKEY=pixie
SECRET=dust
KB=http://127.0.0.1:8080/1.0/kb
ACTKEY=10cbc7b6-42bf-4618-90d0-7d6f4047fe62
TRANSKEY_AUTH=INV-003-AUTH
TRANSKEY_VOID=INV-003-VOID

# authorize
curl -v \
  -u admin:password \
  -H "X-Killbill-ApiKey: $APIKEY" \
  -H "X-Killbill-ApiSecret: $SECRET" \
  -H "Content-Type: application/json" \
  -H "X-Killbill-CreatedBy: curl" \
  --data-binary '{"transactionType":"AUTHORIZE","amount":"10","currency":"USD","transactionExternalKey":"$TRANSKEY_AUTH"}' \
  "$KB/accounts/$ACTKEY/payments"

PAYMENTID=96ff6a45-732e-4b14-b201-2c7a143da86f # this comes from a previous authorize attempt

# void
curl -v \
  -X DELETE \
  -u admin:password \
  -H "X-Killbill-ApiKey: $APIKEY" \
  -H "X-Killbill-ApiSecret: $SECRET" \
  -H "Content-Type: application/json" \
  -H "X-Killbill-CreatedBy: curl" \
  --data-binary '{"transactionExternalKey":"$TRANSKEY_VOID"}' \
  "$KB/payments/$PAYMENTID"