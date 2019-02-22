# Thinkific API

## General

- App URL: https://navy-thinkific.herokuapp.com
- Github URL: https://github.com/navyboys/thinkific
- UI supported: Signup page & Single Page to consume the API
- OAuth with Google supported
- Code protected by RuboCop & Brakeman

## Endpoints

###### Registration

```bash
curl -X POST https://navy-thinkific.herokuapp.com/users --data "email=ben@test.com&password=ben123"
# {"status":"success","api_key":"c7ed685181e5aab4a00d82e2c68cd133"
```

###### Get Current Integer

```bash
curl https://navy-thinkific.herokuapp.com/api/v1/current -H 'Authorization: Token token="c7ed685181e5aab4a00d82e2c68cd133"'
# {"status":"success","integer":0}
```

###### Get Next Integer

```bash
curl https://navy-thinkific.herokuapp.com/api/v1/next -H 'Authorization: Token token="c7ed685181e5aab4a00d82e2c68cd133"'
# {"status":"success","integer":1}
```

###### Reset Integer

```bash
curl -X PUT https://navy-thinkific.herokuapp.com/api/v1/current -H 'Authorization: Token token="c7ed685181e5aab4a00d82e2c68cd133"' --data current=88
# {"status":"success","integer":88}
```

## Screenshots

###### Registration

![Registration](https://i.ibb.co/rGVTg6m/Screen-Shot-2019-02-20-at-11-47-17-AM.png)

###### Home Page

![Home Page](https://i.ibb.co/f9RNBh8/Screen-Shot-2019-02-20-at-11-40-19-AM.png)
