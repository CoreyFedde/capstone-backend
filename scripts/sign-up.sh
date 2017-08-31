#!/bin/bash
EMAIL="corey"
PASSWORD="1"

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/sign-up"
curl "https://thawing-dusk-42030.herokuapp.com/sign-up" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'

echo
