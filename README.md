# FUMO


## Get Refer List API Integration

- 
## TO DO LIST

- [ ] Splash Screen ပြောင်းရန်။

## API Testing 

- [ ] Login မှာ 

```bash

The following assertion was thrown while handling a gesture:
Object/factory with  type UserLogin is not registered inside GetIt.
(Did you accidentally do GetIt sl=GetIt.instance(); instead of GetIt sl=GetIt.instance;
Did you forget to register it?)
'package:get_it/get_it_impl.dart':
Failed assertion: line 372 pos 7: 'instanceFactory != null'
```


// ငြိမ်းချမ်းဇော်  - ၃၃ - PSO - ဖားကန့် 

## Provider နဲ့ UI Migration လုပ်ရမယ်။

### Home Page
- [ ] User Provider 
- [ ] Crypto Provider


## Update Design Pattern

- [ ] Provider -> API Call -> Model -> Entity
- [ ] Screen -> Provider

- [ ] Screen (၉) ခု ရေးထားရန်။

## Splash Screen ပြောင်းရန်။

## Crypto မှာ API Key လိုနေတယ်


I/flutter (13257): {"status":{"timestamp":"2023-06-22T03:46:56.812Z","error_code":1002,"error_message":"API key missing.","elapsed":0,"credit_count":0}}

header မှာ ဒါထည့်ပေးရမယ်။

X-CMC_PRO_API_KEY : d1625c62-41e0-47f7-825e-b86499c3c03a

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