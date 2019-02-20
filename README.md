# Thinkific API

## Endpoints

###### Registration

```bash
curl -X POST http://localhost:3000/users --data "email=ben@test.com&password=ben123"
# {"status":"success","api_key":"038b4c3e17e277daee6946709fc9d1bc"
```

###### Get Current Integer

```bash
curl http://localhost:3000/api/v1/current -H 'Authorization: Token token="038b4c3e17e277daee6946709fc9d1bc"'
# {"status":"success","integer":91}
```

###### Get Next Integer

```bash
curl http://localhost:3000/api/v1/next -H 'Authorization: Token token="038b4c3e17e277daee6946709fc9d1bc"'
# {"status":"success","integer":92}
```

###### Reset Integer

```bash
curl -X PUT http://localhost:3000/api/v1/current -H 'Authorization: Token token="038b4c3e17e277daee6946709fc9d1bc"' --data current=0
# {"status":"success","integer":0}
```

## Others

- UI supported: Signup page & Single Page to consume the API
- OAuth with Google supported
- Github URL:
- App URL: 
