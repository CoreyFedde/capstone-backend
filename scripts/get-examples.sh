#!/bin/bash
TOKEN="BAhJIiU4MjUxOGUwNjFmNTNiZDBhNGIzMmIyY2QzOGM1ZWVkOAY6BkVG--effb639eb4222df6e8ce4f3220fcf050d086823e"

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/loans/62"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
