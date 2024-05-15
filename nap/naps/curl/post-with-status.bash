response=$(curl -s -w "\n%{http_code}" -X POST  -H "Content-Type: application/json" -H "AUTHORIZATION: STATIC $TOKEN" https://... -d $data)
