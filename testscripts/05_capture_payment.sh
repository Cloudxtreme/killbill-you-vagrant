# curl requests: capture payment

APIKEY=pixie
SECRET=dust
KB=http://127.0.0.1:8080/1.0/kb
AUTHID=bb4ac136-0dab-485b-ba27-14a11e715e24
TRANSKEY=INV-001-CAPTURE

# capture payment
curl -v \
  -u admin:password \
  -H "X-Killbill-ApiKey: $APIKEY" \
  -H "X-Killbill-ApiSecret: $SECRET" \
  -H "Content-Type: application/json" \
  -H "X-Killbill-CreatedBy: curl" \
  --data-binary '{"amount":"5","currency":"USD","transactionExternalKey":""$TRANSKEY""}' \
  "$KB/payments/$AUTHID"