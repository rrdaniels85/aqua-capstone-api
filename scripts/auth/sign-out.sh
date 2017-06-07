#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/sign-out"
TOKEN="BAhJIiVhYTM3NWYzNDgzODdmMmU0Y2U2N2NiYjc4OWExZjgyOQY6BkVG--b1ae33cf9f5f0b591a2e4358d63e47d8acd39b5e"
ID=1

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN"

echo
