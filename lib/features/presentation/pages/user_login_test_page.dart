import 'dart:ui';

import 'package:base/core/util/loading_dialog.dart';
import 'package:base/features/presentation/components/form_elements/our_text_input.dart';
import 'package:base/features/presentation/components/form_elements/our_submit_button.dart';
import 'package:base/features/presentation/pages/home_page.dart';
import 'package:base/features/presentation/pages/user_register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/const/data.dart';
import '../providers/user_provider.dart';


class UserLoginPage extends StatefulWidget {
  static String routeName = "/UserLoginPage";
  const UserLoginPage({Key? key}) : super(key: key);

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  TextEditingController emailTec = TextEditingController();
  TextEditingController passwordTec = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _autoLogin();
    });
  }

  void _autoLogin()async{
    LoadingDialog.show(context);
    String status = await Provider.of<UserProvider>(context, listen: false).autoLogin();
    LoadingDialog.hide(context);
    if(status == "success"){
      //Navigator.pushNamed(context, HomePage.routeName);
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: _mainWidget(),
      ),
    );
  }

  Widget _mainWidget(){
    return Container(
      // height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient : RadialGradient(
          // center: Alignment(0.7, -0.6), // near the top right
         radius: 1.0,
          colors: <Color>[
              Colors.white, //Color(0xFFFFFF00), // yellow sun
            Colors.green, // Color(0xFF0099FF), // blue sky
          ],
          // stops: <double>[0.4, 1.0],
        )
            /*
        gradient:LinearGradient(
          colors: [Colors.yellow, Colors.green],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )

             */
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Expanded(child: Container()),
          Image.asset(image10AssetUrl),
          Text("FUMO", style: Theme.of(context).textTheme.bodyLarge,),
          Text("Welcome Back", style: Theme.of(context).textTheme.headlineLarge,),
          SizedBox(height: 16,),
          OurTextInput(label: "Email", placeHolder: "enter your email", textEditingController: emailTec, callback: (String? str){}, submit: (String? str){}, icon: Icons.email, password: false,),

          SizedBox(height: 8.0,),
          OurTextInput(label: "Password", placeHolder: "enter your password", textEditingController: passwordTec, callback: (String? str){}, submit: (String? str){}, icon: Icons.password , password: true),

          SizedBox(height: 8.0,),
          OurSubmitButton(text:"Login", callback: _login, width: 0.8,),
          SizedBox(height: 8.0,),
          Text("Don't have an account?"),
          SizedBox(height: 8.0,),
          OurSubmitButton(text:"Register", callback: _register, link: true, width: 0.8,),
          Expanded(child: Container()),
        ],
      ),
    );
  }

  void _register()async{
    // alert to get account facebook page
    /*
    showAlertDialog(context, "Create New Account", "iCoffer Facebook Page မှာ Account အသစ်ရယူနိုင်ပါပြီ။", Colors.green, (){
      // Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName, (route) => false);
    });

     */
    Navigator.pushNamedAndRemoveUntil(context, UserRegisterPage.routeName, (route) => false);
  }

  bool isEmail(String em) {

    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  void _login()async{
    print("UserLoginPage->_login");
    String email = emailTec.text;
    String password = passwordTec.text;

    // String email = "vocebe9500@nasskar.com";
    // String password = "P@ssw0rd123";

    // String email = "thihathuzar1995@gmail.com";
    // String password = "Thiha123!@#";

    print("$email and $password");
    // show loading screen
    LoadingDialog.show(context);
    String str = await Provider.of<UserProvider>(context, listen: false).userLoginPlz(email: email, password: password);
    // hide loading screen
    LoadingDialog.hide(context);

    print("str $str");

    if(str == "success"){
      //Navigator.pushNamed(context, HomePage.routeName);
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }
    else{
      // show error message
      // showAlertDialog(context, "Login Fail", "Please check email , password and Try Again!", Colors.red, (){});
      if(str == "null"){
        str = "No Internet Connection";
      }
      showAlertDialog(context, "Something Went Wrong", str, Colors.red, (){});
    }


    /*

    if(isEmail(email) == false){
      showAlertDialog(context, "Invalid Email", "Check your email address", Colors.red, (){
        // Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName, (route) => false);
      });
      return;
    }



    String status = "success"; // await Provider.of<UserProvider>(context, listen:false).userLoginPlz(email: email, password: password);
    // close loading dialog
    Navigator.pop(context);
    if(status == "success"){
      Navigator.pushNamed(context, HomePage.routeName);
    }
    else{
      // show error message
      // showAlertDialog(context, "Login Fail", "Please check email , password and Try Again!", Colors.red, (){});
      showAlertDialog(context, "Need Approval / Wrong Password", "Contact to facebook page for Approval!!", Colors.red, (){});
    }

     */

  }

  showAlertDialog(BuildContext context,String title, String info, Color color, VoidCallback callback) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK",style: TextStyle(color: color)),
      onPressed: () {
        Navigator.pop(context);
        callback();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(info, style: TextStyle(color: color),),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}

