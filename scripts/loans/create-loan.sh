TOKEN="BAhJIiUwMzEwZTFjNDE0ODQ1NjA0MDIzOTgyYjA1NDk1NGQ5MQY6BkVG--5e3af25118062b277cb6f750433bd231cfcd74f3"
NAME="Curl test"
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
