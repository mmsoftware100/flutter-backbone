# FUMO

- [ ] Screen (၉) ခု ရေးထားရန်။


## Input Validation မှားရင်း မှားတဲ့အကြောင်း JSON မှာ ပြရန်။

## Database Constraint Exception တက်လျှင် JSON မှာ message ပြပေးရန်။

နမူနာ Error Response

```json
{
  "status" : false,
  "message" : "input validation faield",
  "error" : {
    "password" : "Password should have at least one Capital Character"
  }
}
```

flutter pub run build_runner build --delete-conflicting-outputs