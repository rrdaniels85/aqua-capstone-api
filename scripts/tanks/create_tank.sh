#!/bin/bash

# Note: only values accepted for water: 'Salt' or 'Fresh' - set in the model
API="http://localhost:4741"
URL_PATH="/tanks"
TOKEN="BAhJIiUwZWE3NmEwNmJhNzQ3NjEwNDhlZmFhZTBlMzczYTg5YwY6BkVG--1ffe820340deceb7c8e14e61d0886dca502ed930"
NAME="Marlin's Tank"
WATER="Salt"

curl "${API}${URL_PATH}" \
 --include \
 --request POST \
 --header "Content-Type: application/json" \
 --header "Authorization: Token token=${TOKEN}" \
 --data '{
   "tank": {
     "name": "'"${NAME}"'",
     "water": "'"${WATER}"'"
   }
 }'

 echo
