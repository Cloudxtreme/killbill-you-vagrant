# curl requests: purchase

APIKEY=pixie
SECRET=dust
KB=http://127.0.0.1:8080/1.0/kb
ACTKEY=10cbc7b6-42bf-4618-90d0-7d6f4047fe62
TRANSKEY=INV-001-PURCHASE

# purchase
curl -v \
  -X POST \
  -u admin:password \
  -H "X-Killbill-ApiKey: $APIKEY" \
  -H "X-Killbill-ApiSecret: $SECRET" \
  -H "Content-Type: application/json" \
  -H "X-Killbill-CreatedBy: curl" \
  --data-binary '{"transactionType":"PURCHASE","amount":"10","currency":"USD","transactionExternalKey":"$TRANSKEY"}' \
  "$KB/accounts/$ACTKEY/payments"