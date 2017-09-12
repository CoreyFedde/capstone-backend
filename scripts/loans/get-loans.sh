TOKEN="BAhJIiVhYjBkNDBhN2ZmYWVkN2E1YWEyZjUxMzFiYzA2ZDIyMAY6BkVG--35f7c61ce4801ab379188ccfbbfb815dee955391"

curl --include --request GET http://localhost:4741/loans \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}"
