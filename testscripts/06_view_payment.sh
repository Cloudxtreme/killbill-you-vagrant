# curl requests: view payment

APIKEY=pixie
SECRET=dust
KB=http://127.0.0.1:8080/1.0/kb
CAPTUREID=bb4ac136-0dab-485b-ba27-14a11e715e24

# view payment
curl -v \
  -u admin:password \
  -H "X-Killbill-ApiKey: $APIKEY" \
  -H "X-Killbill-ApiSecret: $SECRET" \
  $KB/payments/$CAPTUREID/