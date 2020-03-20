#!/bin/sh

# send alert for RocketChat

#Variables
USER=$1
PASSWORD=$2
CHANNEL=$3
MESSAGE=$4
API_URL="https://rocket-chat";
USER_ID="userId"

LOGIN_URL="$API_URL/api/v1/login"

AUTH_TOKEN=$(curl -L $LOGIN_URL -d "user=$USER&password=$PASSWORD" | cut -d\" -f 14)

POST_URL=$API_URL"/api/v1/chat.postMessage"
curl -H "X-User-Id: $USER_ID" \
     -H "X-Auth-Token: $AUTH_TOKEN" \
     -H "Content-type:application/json"  \
     -d '{"channel": "'$CHANNEL'", "text": "'"$MESSAGE"'" }' \
     $POST_URL