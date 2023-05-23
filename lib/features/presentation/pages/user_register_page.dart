

import 'package:base/features/presentation/components/form_elements/our_text_input.dart';
import 'package:base/features/presentation/components/form_elements/our_submit_button.dart';
import 'package:base/features/presentation/pages/user_login_test_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

import '../../data/const/data.dart';
class UserRegisterPage extends StatefulWidget {
  static String routeName = "/UserRegisterPage";
  const UserRegisterPage({Key? key}) : super(key: key);

  @override
  State<UserRegisterPage> createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {
  TextEditingController nameTec = TextEditingController();
  TextEditingController emailTec = TextEditingController();
  TextEditingController passwordTec = TextEditingController();
  TextEditingController passwordConfirmTec = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(child: _mainWidget()),
      ),
    );
  }

  Widget _mainWidget(){
    return Container(
      height: MediaQuery.of(context).size.height,
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
            colors: [Colors.purple, Colors.blue],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          )

         */
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: double.infinity,),

          SizedBox(height: 8.0,),
          OurTextInput(label: "Name", placeHolder: "enter your name", textEditingController: nameTec, callback: (String? str){}, submit: (String? str){}, icon: Icons.person,),

          SizedBox(height: 8.0,),
          OurTextInput(label: "Email", placeHolder: "enter your email", textEditingController: emailTec, callback: (String? str){}, submit: (String? str){}, icon: Icons.email,),

          SizedBox(height: 8.0,),
          OurTextInput(label: "Password", placeHolder: "enter your password", textEditingController: passwordTec, callback: (String? str){}, submit: (String? str){}, icon: Icons.password, password: true,),

          SizedBox(height: 8.0,),
          OurTextInput(label: "Confirm Password", placeHolder: "re-enter your password", textEditingController: passwordConfirmTec, callback: (String? str){}, submit: (String? str){}, icon: Icons.password, password: true),

          SizedBox(height: 8.0,),
          OurSubmitButton(text:"Register", callback: _register, width: 0.8,),
          SizedBox(height: 8.0,),
          Text("Already have an account?"),
          SizedBox(height: 8.0,),
          OurSubmitButton(text:"Login", callback: _login, link: true, width: 0.8,)
          /*
          Container(
            height: 200,
          )

           */
        ],
      ),
    );
  }

  void _login()async{
    Navigator.pushNamedAndRemoveUntil(context, UserLoginPage.routeName, (route) => false);
  }

  void _register()async{
    String email = emailTec.text;
    String password = passwordTec.text;
    String name = nameTec.text;

    String status = await Provider.of<UserProvider>(context, listen:false).userRegisterPlz(password: password, email: email, name: name);
    // close loading dialog
    Navigator.pop(context);
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

