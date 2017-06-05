#!/bin/bash
API="http://localhost:4741"
URL_PATH="/tanks"
TOKEN="BAhJIiUwZWE3NmEwNmJhNzQ3NjEwNDhlZmFhZTBlMzczYTg5YwY6BkVG--1ffe820340deceb7c8e14e61d0886dca502ed930"
NAME="Nemo's Tank"
WATER="Salt"
ID=2

curl "${API}${URL_PATH}/${ID}" \
 --include \
 --request PATCH \
 --header "Content-Type: application/json" \
 --header "Authorization: Token token=${TOKEN}" \
 --data '{
   "tank": {
     "name": "'"${NAME}"'",
     "water": "'"${WATER}"'"
   }
 }'

 echo
