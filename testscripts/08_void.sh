# curl requests: void

APIKEY=pixie
SECRET=dust
KB=http://127.0.0.1:8080/1.0/kb
PAYMENTID=860d9f31-94cc-4f52-872d-42d6d280e9f5
TRANSKEY=INV-001-VOID

# void
curl -v \
  -X DELETE \
  -u admin:password \
  -H "X-Killbill-ApiKey: $APIKEY" \
  -H "X-Killbill-ApiSecret: $SECRET" \
  -H "Content-Type: application/json" \
  -H "X-Killbill-CreatedBy: curl" \
  --data-binary '{"transactionExternalKey":"$TRANSKEY"}' \
  "$KB/payments/$PAYMENTID"