#!/bin/sh
API="http://localhost:4741"
URL_PATH="/tanks"
TOKEN="BAhJIiUwZWE3NmEwNmJhNzQ3NjEwNDhlZmFhZTBlMzczYTg5YwY6BkVG--1ffe820340deceb7c8e14e61d0886dca502ed930"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"


echo
