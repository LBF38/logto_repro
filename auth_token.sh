#!/bin/bash
creds=$(echo -n "15aizrn12ecvunt6xskl2:6LdsML7toHMJYxarcKRiYd5Aekp6J4lA" | base64)
token=$(curl --location \
    --request POST 'http://localhost:3001/oidc/token' \
    --header "Authorization: Basic $creds" \
    --header 'Content-Type: application/x-www-form-urlencoded' \
    --data-urlencode 'grant_type=client_credentials' \
    --data-urlencode 'resource=https://default.logto.app/api' \
    --data-urlencode 'scope=all' \
    --verbose)
printf "\nToken: \n%s\n\n" "$token"
access_token=$(echo "$token" | jq -r '.access_token')
printf "\naccess_token: %s\n\n" "$access_token"
response=$(curl --location \
    --request GET 'https://default.logto.app/api/users' \
    --header "Authorization: Bearer ${access_token}" \
    --verbose)
echo "$response"
