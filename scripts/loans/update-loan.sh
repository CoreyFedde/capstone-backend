LENDER="changed"
ID="1"
TOKEN="BAhJIiUyOGU0MTM3OWQwMDI1MzdmOTMwODY3YWQxMjU1MjdjYQY6BkVG--1afc31b52c73c19d4ce9270eac8596a0d129befb"

curl --include --request PATCH http://localhost:4741/loans/$ID \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "loan": {
      "lender": "'"${LENDER}"'"
    }
  }'
