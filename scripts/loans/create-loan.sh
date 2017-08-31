TOKEN="BAhJIiViOTE0ZjQ4ZTM5NTc2M2FmZGIxMTZmZWNkZTkwNjRjYgY6BkVG--3e3918a4a22e98ad00e21261bff62504e6bf4db1"
NAME="Curl test"
LENDER="Chase"
PRINCIPAL="20000"
INTEREST="4.5"
LENGTH="1"
START="08-25-2017"
MIN="200"
CURRENT="200"

curl --include --request POST https://thawing-dusk-42030.herokuapp.com/loans \
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
