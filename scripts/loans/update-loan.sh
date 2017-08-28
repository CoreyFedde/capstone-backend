LENDER="changed"
ID="1"
TOKEN="BAhJIiVjMTAwYTI2ZmJhYzIyOTg5NThhNTlhOTdhMDUzMTY4YQY6BkVG--934d1e72d68391bc0f646f06f343843c707016bf"

curl --include --request PATCH http://localhost:4741/loans/$ID \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "loan": {
      "lender": "'"${LENDER}"'"
    }
  }'
