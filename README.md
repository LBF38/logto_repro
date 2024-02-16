# Logto Reproduction repository

This repository is for reproducing bugs and issues found with the [Logto](https://logto.io) library.

## Machine to Machine (M2M) Authentication

```bash
curl --location
  --request POST 'http://localhost:3001/oidc/token'
  # Credentials are constructed by "<app-id>:<app-secret>" and encoded in base64
  --header 'Authorization: Basic MTVhaXpybjEyZWN2dW50Nnhza2wyOjZMZHNNTDd0b0hNSll4YXJjS1JpWWQ1QWVrcDZKNGxB'
  --header 'Content-Type: application/x-www-form-urlencoded'
  --data-urlencode 'grant_type=client_credentials'
  --data-urlencode 'resource=https://default.logto.app/api'
  --data-urlencode 'scope=all'
```

## Access ressources

```bash
curl --location
  --request GET 'https://default.logto.app/api'
  --header 'Authorization: Bearer <granted-access-token>'
```
