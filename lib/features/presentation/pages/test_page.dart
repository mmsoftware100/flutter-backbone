import 'package:base/features/presentation/pages/claim_point_page.dart';
import 'package:base/features/presentation/pages/home_page.dart';
import 'package:base/features/presentation/pages/user_login_test_page.dart';
import 'package:flutter/material.dart';

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
          ListTile(title: Text("Landing Page"), onTap: (){ Navigator.pushNamed(context, UserLoginTestPage.routeName); },),
          ListTile(title: Text("Landing Page Two"), onTap: (){ Navigator.pushNamed(context, UserLoginTestPage.routeName); },),
          ListTile(title: Text("Home Page"), onTap: (){ Navigator.pushNamed(context, HomePage.routeName); },),
          ListTile(title: Text("Claim Page"), onTap: (){ Navigator.pushNamed(context, ClaimPointPage.routeName); },),
        ],
      ),
    );
  }
}
