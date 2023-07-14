import 'package:base/features/presentation/pages/aboutus_page.dart';
import 'package:base/features/presentation/pages/account_page.dart';
import 'package:base/features/presentation/pages/balance_page.dart';
import 'package:base/features/presentation/pages/calculator_page.dart';
import 'package:base/features/presentation/pages/claim_point_page.dart';
import 'package:base/features/presentation/pages/friend_page.dart';
import 'package:base/features/presentation/pages/home_page.dart';
import 'package:base/features/presentation/pages/myteam_page.dart';
import 'package:base/features/presentation/pages/payment_page.dart';
import 'package:base/features/presentation/pages/setting_page.dart';
import 'package:base/features/presentation/pages/user_account_page.dart';
import 'package:base/features/presentation/pages/landing_page.dart';
import 'package:base/features/presentation/pages/user_login_page.dart';
import 'package:base/features/presentation/pages/user_login_test_page.dart';
import 'package:base/features/presentation/pages/user_register_page.dart';
import 'package:base/features/presentation/pages/wallet_page.dart';
import 'package:base/features/presentation/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../domain/usecases/user_login.dart';

class TestPage extends StatefulWidget {
  static String routeName = "/TestPage";
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Page"),
      ),
      body: ListView(
        children: [

          ListTile(title: Text("Login Test"), onTap: _login,),
          Divider(),
          ListTile(title: Text("Landing Page"), onTap: (){ Navigator.pushNamed(context, LandingPage.routeName); },),
          ListTile(title: Text("User Login Page"), onTap: (){ Navigator.pushNamed(context, UserLoginPage.routeName); },),
          // ListTile(title: Text("Landing Page"), onTap: (){ Navigator.pushNamed(context, UserLoginTestPage.routeName); },),
          // ListTile(title: Text("Landing Page Two"), onTap: (){ Navigator.pushNamed(context, UserLoginTestPage.routeName); },),
          ListTile(title: Text("Home Page"), onTap: (){ Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName, (route) => false); },),
          ListTile(title: Text("Claim Page"), onTap: (){ Navigator.pushNamed(context, ClaimPointPage.routeName); },),
          ListTile(title: Text("Balance Page"), onTap: (){ Navigator.pushNamed(context, BalancePage.routeName); },),
          ListTile(title: Text("Friend Page"), onTap: (){ Navigator.pushNamed(context, FriendPage.routeName); },),
          ListTile(title: Text("UserAccount"), onTap: (){ Navigator.pushNamed(context, UserAccountPage.routeName); },),

          ListTile(title: Text("Login"), onTap: (){ Navigator.pushNamed(context, LandingPage.routeName); },),
          ListTile(title: Text("Register"), onTap: (){ Navigator.pushNamed(context, UserRegisterPage.routeName); },),

          ListTile(title: Text("Account"), onTap: (){ Navigator.pushNamed(context, AccountPage.routeName); },),
          ListTile(title: Text("Setting"), onTap: (){ Navigator.pushNamed(context, SettingPage.routeName); },),
          ListTile(title: Text("PaymentPage"), onTap: (){ Navigator.pushNamed(context, PaymentPage.routeName); },),
          ListTile(title: Text("MyTeamPage"), onTap: (){ Navigator.pushNamed(context, MyTeamPage.routeName); },),
          ListTile(title: Text("CalculatorPage"), onTap: (){ Navigator.pushNamed(context, CalculatorPage.routeName); },),
          ListTile(title: Text("WalletPage"), onTap: (){ Navigator.pushNamed(context, WalletPage.routeName); },),
          ListTile(title: Text("AboutUsPage"), onTap: (){ Navigator.pushNamed(context, AboutUsPage.routeName); },),
        ],
      ),
    );
  }

  void _login(){
    Provider.of<UserProvider>(context, listen:false).userLoginPlz(email: "admin", password: "password");
  }
}
