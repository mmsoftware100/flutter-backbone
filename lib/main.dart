


import 'package:base/features/presentation/pages/aboutus_page.dart';
import 'package:base/features/presentation/pages/account_page.dart';
import 'package:base/features/presentation/pages/calculator_page.dart';
import 'package:base/features/presentation/pages/myteam_page.dart';
import 'package:base/features/presentation/pages/setting_page.dart';
import 'package:base/features/presentation/pages/user_account_page.dart';
import 'package:base/features/presentation/pages/user_login_test_page.dart';
import 'package:base/features/presentation/pages/user_register_page.dart';
import 'package:base/features/presentation/providers/crpyto_provider.dart';


import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'features/data/const/data.dart';
import 'features/data/themes/news_theme.dart';
import 'features/presentation/pages/balance_page.dart';
import 'features/presentation/pages/claim_point_page.dart';
import 'features/presentation/pages/friend_page.dart';
import 'features/presentation/pages/home_page.dart';
import 'features/presentation/pages/payment_page.dart';
import 'features/presentation/pages/test_page.dart';
import 'features/presentation/pages/landing_page.dart';
import 'features/presentation/pages/user_login_page.dart';
import 'features/presentation/pages/wallet_page.dart';
import 'features/presentation/providers/user_provider.dart';
import 'injection_container.dart' as di;

import 'package:provider/provider.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel_martin', // id
    'High Importance Notifications Martin', // title
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


/*
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("_firebaseMessagingBackgroundHandler");
  print(message);
  print(message.data.toString());
  print("app_url");
  print(message.data['app_url']);
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

 */

void main() async{
  WidgetsFlutterBinding.ensureInitialized();


  /*

  if (Platform.isAndroid) {
    // Android-specific code
    // await Firebase.initializeApp();
    FacebookAudienceNetwork.init(
      // testingId: "37b1da9d-b48c-4103-a393-2e095e734bd6", //optional
        iOSAdvertiserTrackingEnabled: true //default false
    );

    try{
      await Firebase.initializeApp();
      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
    catch(exp){
      print("firebase init exp");
      print(exp);
    }

    try{
      // MobileAds.instance.initialize();
    }
    catch(exp){
      print("MobileAds.instance.initialize init exp");
      print(exp);
    }

  } else if (Platform.isIOS) {
    // iOS-specific code
  }

   */



  // Need to override H


  /*
  HttpProxy httpProxy = await HttpProxy.createHttpProxy();

  //httpProxy.host = "mgtrick1:htethtetaung13@45.192.136.51";
  //httpProxy.port = "5345";
  httpProxy.host =  "${proxyDataSample.username}:${proxyDataSample.password}@${proxyDataSample.host}"; // "mgtrick1:htethtetaung13@45.192.136.51";
  httpProxy.port = "${proxyDataSample.port}";

  HttpOverrides.global=httpProxy;

   */


  /*
  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    var proxyAvailable = await WebViewFeature.isFeatureSupported(WebViewFeature.PROXY_OVERRIDE);

    if (proxyAvailable) {
      ProxyController proxyController = ProxyController.instance();

      await proxyController.clearProxyOverride();
      await proxyController.setProxyOverride(
          settings: ProxySettings(
              proxyRules: [
                ProxyRule(url: "https://myproxy.com")
              ],
              bypassRules: ["www.excluded.*"]
          ));
    }
  }

   */



  await di.init();
  runApp(
      MultiProvider(
          providers: [

            ChangeNotifierProvider(create: (_) =>CryptoProvider(
                selectCrypto: di.sl(),
            )),

            ChangeNotifierProvider(create: (_) =>UserProvider(
                userLogin: di.sl(),
                userRegister: di.sl(),
                localStorage: di.sl()
            )),
          ],
          child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: newsTheme,
      /*
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // primarySwatch: Colors.blue,
        primaryColor: Color(0xFFF2EB91),

      ),

       */
      //initialRoute: UserLoginPage.routeName,
      initialRoute: LandingPage.routeName,
      routes: {
        TestPage.routeName: (context) => TestPage(),
        LandingPage.routeName:(context) => LandingPage(),
        UserLoginPage.routeName : (context) => UserLoginPage(),

        HomePage.routeName: (context) => HomePage(),
        ClaimPointPage.routeName: (context) => ClaimPointPage(),
        BalancePage.routeName: (context) => BalancePage(),
        FriendPage.routeName: (context) => FriendPage(),
        UserLoginPage.routeName: (context) => UserLoginPage(),
        UserRegisterPage.routeName: (context) => UserRegisterPage(),
        UserAccountPage.routeName: (context) => UserAccountPage(),
        PaymentPage.routeName: (context) => PaymentPage(),
        AccountPage.routeName: (context) => AccountPage(),
        SettingPage.routeName: (context) => SettingPage(),
        MyTeamPage.routeName: (context) => MyTeamPage(),
        CalculatorPage.routeName:(context) => CalculatorPage(),
        UserLoginPage.routeName:(context) => UserLoginPage(),
        WalletPage.routeName:(context) => WalletPage(),
        AboutUsPage.routeName:(context) => AboutUsPage(),
        WalletPage.routeName:(context) => WalletPage()
      },
    );
  }
}

