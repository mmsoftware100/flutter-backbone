

import 'package:base/core/util/loading_dialog.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/presentation/components/form_elements/our_text_input.dart';
import 'package:base/features/presentation/components/form_elements/our_submit_button.dart';
import 'package:base/features/presentation/pages/user_login_test_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

import '../../data/const/data.dart';
import 'home_page.dart';
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
  TextEditingController refTec = TextEditingController();
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

          Image.asset(image10AssetUrl),
          Text("FUMO", style: Theme.of(context).textTheme.bodyLarge,),
          Text("Welcome Back", style: Theme.of(context).textTheme.headlineLarge,),
          SizedBox(height: 8.0,),
          OurTextInput(label: "Name", placeHolder: "enter your name", textEditingController: nameTec, callback: (String? str){}, submit: (String? str){}, icon: Icons.person,),

          SizedBox(height: 8.0,),
          OurTextInput(label: "Email", placeHolder: "enter your email", textEditingController: emailTec, callback: (String? str){}, submit: (String? str){}, icon: Icons.email,),

          SizedBox(height: 8.0,),
          OurTextInput(label: "Password", placeHolder: "enter your password", textEditingController: passwordTec, callback: (String? str){}, submit: (String? str){}, icon: Icons.password, password: true,),

          SizedBox(height: 8.0,),
          OurTextInput(label: "Confirm Password", placeHolder: "enter your password again", textEditingController: passwordConfirmTec, callback: (String? str){}, submit: (String? str){}, icon: Icons.password, password: true,),

          SizedBox(height: 8.0,),
          OurTextInput(label: "Referral Code", placeHolder: "enter your referral code", textEditingController: refTec, callback: (String? str){}, submit: (String? str){}, icon: Icons.password, password: true),

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

    if(passwordTec.text != passwordConfirmTec.text){
      // need to be same password value
      showAlertDialog(context, "Type Same Password", "Password need to be same in both password fields", Colors.red, (){});
      return;
    }
    String email = emailTec.text;
    String password = passwordTec.text;
    String name = nameTec.text;
    String ref = refTec.text;

    print(email + " , " + password + " , " + name + " , " + ref);

    User user = User(
        username: name,
        email: email,
        password: password,
        referCode: ref,
        phone: "",
        profile_picture: "",
        address: "",
        remark: "",
        accessToken: "", level: '', wallet_address: '', deposit_address: ''
    );


    // create user
    // call register method in User Provider
    // User user = User(id: id, name: name, email: email, password: password, referCode: referCode, phone: phone, img: img, address: address, remark: remark, accessToken: accessToken, createdAt: createdAt, modifiedAt: modifiedAt)
    LoadingDialog.show(context);
    String status = await Provider.of<UserProvider>(context, listen:false).userRegisterPlz(user: user);
    // close loading dialog
    LoadingDialog.hide(context);
    if(status == "success"){
      // Navigator.pushNamed(context, HomePage.routeName);

      showAlertDialog(context, "Verify Email", "Check your email inbox and click on verification link", Colors.red, (){});
    }
    else{
      print('Status is -->');
      print(status);
      // show error message
      // showAlertDialog(context, "Login Fail", "Please check email , password and Try Again!", Colors.red, (){});

      showAlertDialog(context, "Something went wrong", status, Colors.red, (){});
    }

    // Navigator.pop(context);
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

