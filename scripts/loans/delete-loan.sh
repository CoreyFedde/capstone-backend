TOKEN="BAhJIiUxZjMwMzg4MmMyZjRkMTFkNDk1NmE1ZmJjMzYxY2QzMgY6BkVG--6b5c3e595eef4118e921136a543248ce1d14d6f4"
ID="4"
curl --include --request DELETE http://localhost:4741/loans/$ID \
  --header "Authorization: Token token=${TOKEN}"
