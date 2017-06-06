#!/bin/sh
API="http://localhost:4741"
URL_PATH="/tanks/4/animals"
TOKEN="BAhJIiU3YWY1Y2Y3OTQ0NzJiZTNkZDFiNGUzYTMwOTVhZTFjZQY6BkVG--f43065c49d87026a01e5db05763142285d96cfd0"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"


echo
