TOKEN="BAhJIiUxZjMwMzg4MmMyZjRkMTFkNDk1NmE1ZmJjMzYxY2QzMgY6BkVG--6b5c3e595eef4118e921136a543248ce1d14d6f4"
NAME="TEST4"
LENDER="Chase"
PRINCIPAL="20000"
INTEREST="4.5"
LENGTH="1"
START="08-25-2017"
MIN="200"
CURRENT="200"

curl --include --request POST http://localhost:4741/loans \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "loan": {
      "name": "'"${NAME}"'",
      "lender": "'"${LENDER}"'",
      "principal": "'"${PRINCIPAL}"'",
      "interest_rate": "'"${INTEREST}"'",
      "loan_length": "'"${LENGTH}"'",
      "start_date": "'"${START}"'",
      "minimum_monthly_payment": "'"${MIN}"'",
      "current_monthly_payment": "'"${CURRENT}"'"
    }
  }'
