# FUMO

## 2023-07-21 
- [ ] Webview Progress
- [ ] Webview URL
- [x] Change Password API Integration
- [ ] Drawer မှာ Header ထည့်မယ်။
- [ ] User Login မှာ hard coding ဖြုတ်ရန်
- [ ] APK Release

## 2023-07-19


```bash
══╡ EXCEPTION CAUGHT BY WIDGETS ╞═══════════════════════════════════════════════════════════════════
The following message was thrown:
Warning: This application's locale, ch, is not supported by all of its localization delegates.

• A MaterialLocalizations delegate that supports the ch locale was not found.
• A CupertinoLocalizations delegate that supports the ch locale was not found.

The declared supported locales for this app are: en, ch, jp

See https://flutter.dev/tutorials/internationalization/ for more information about configuring an
app's locale, supportedLocales, and localizationsDelegates parameters.
════════════════════════════════════════════════════════════════════════════════════════════════════
I/flutter ( 4481): [🌎 Easy Localization] [DEBUG] Load Localization Delegate
I/flutter ( 4481): [🌎 Easy Localization] [DEBUG] Load asset from assets/translations

Another exception was thrown: No MaterialLocalizations found.

Another exception was thrown: No MaterialLocalizations found.

Another exception was thrown: A RenderFlex overflowed by 199447 pixels on the bottom.
I/Gralloc4( 4481): mapper 4.x is not supported
W/Gralloc3( 4481): mapper 3.x is not supported
The Flutter DevTools debugger and profiler on Pixel 2 XL is available at: http://127.0.0.1:9100?uri=http://127.0.0.1:52673/0L1yighh8Ok=/

```

## 2023-07-18 To Do List


- [x] App Icon and Name Update
- [x] Error Message တွေကို API က ပြတဲ့အတိုင်း ပြန်ပေးရန်။
- [x] Language Menu ထည့်ရန် ( EN / CH / JP ) 
- [x] Calculator က Webview ခေါ်ရန်။  ( Lanugae အလိုက် ခေါ်တဲ့ URL ပြောင်းရန်)
- [x] API Call တိုင်းမှာ Loading Screen ပြန်ရန်
- [ ] App မှာ ပါတဲ့ စာအားလုံး ဘာသာစကားပြောင်းရန်

- [ ] Deposit မှာ QR Code တွေအပေါ်  longPress => Dialog Withdraw Form
- [ ] Deposit မှာ  QR Code တွေအပေါ် onTap => Copy Text
- [ ] Withdraw မှာ onTap => Copy Text
- [ ] Withdraw မှာ longPress => Dialog Withdraw Form

- [ ] Referral List ကို Home Page မှာ ပြရန်


## Calculator Page ကို Webview နဲ့ ပြမယ်။


## Login က စပြီး API တွေ Home Page မှာ အကုန်ခေါ်ထားမယ်။


## Wallet က Usecase 5 ခု ကို API Integration လုပ်ပြီးရင် backend  နဲ့ ကိစ္စ ပြီးပြီ။

### Select (၃) ခုအရင်လုပ်မယ်။

- [x] Deposit Address Select
- [x] Deposit Transaction Select
- [x] Withdraw Transaction Select


Request Deposit မှာ link နဲ့ deposit_amount field နှစ်ခု လိုနေတယ်။

## To DO

- [ ] User Update ကို Backend API မှာပဲ wallet address နဲ့ deposit address ပြင်နိုင်အောင် သွားလုပ်ရမယ်



## Get Refer List API Integration

- dependency injection လုပ်ရမယ်။

/api/v1/refer API မှာ Referral မရှိရင် အောက်ကလိုမျိုး empty array ပဲ ပြန်ပေးပါ။

```json
{
    "status": true,
    "message": "ReferralApiController->getReferralList success",
    "data": []
}
```


အခုက ဒါမျိုး ပြန်နေတယ်။
```json
{
    "status": "True",
    "auth_id": 145,
    "auth_refer_code": "mOSgqerKLq",
    "all_refer": "No Refer User"
}
```
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