import 'package:base/features/presentation/providers/user_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/util/loading_dialog.dart';
import '../../domain/entities/user.dart';

class ChangePassword extends StatefulWidget {
 // const ChangePassword({super.key});
  static String routeName = "/ChangePassword";
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _oldPasswordController = new TextEditingController();
  TextEditingController _changePasswordController = new TextEditingController();
  TextEditingController _confirmPasswordController = new TextEditingController();
  bool hidePasswordold = true;
  bool hidePasswordnew = true;
  bool hidePasswordconfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Change Password",style: TextStyle(color: Colors.white),).tr(),),
      body: SafeArea(
        child: _mainWidget(),
      ),
    );
  }

  Widget _mainWidget(){
    return Padding(
      padding: EdgeInsets.only(left: 20.0,right: 20.0),
      child: Container(
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            SizedBox(height: 30.0,),
            TextFormField(
            controller: _oldPasswordController,
            obscureText: hidePasswordold,
            decoration: InputDecoration(
              icon: Icon(Icons.lock_clock_rounded),
            labelText: "Old Password",
                suffixIcon: IconButton(
                    onPressed: () => setState(() {
                      hidePasswordold = !hidePasswordold;
                    }),
                    icon: const Icon(Icons.remove_red_eye_outlined)),
        ),
        validator: (value) {
        if (value!.isEmpty) {
        return "Enter Your Old Password";
        }
        // else if (value.length <= 5) {
        // return AppString.passwordValidation;
        // }
        return null;
        },
        ),
              SizedBox(height: 10.0,),
        TextFormField(
        controller: _changePasswordController,
        obscureText: hidePasswordnew,
        decoration: InputDecoration(
          icon: Icon(Icons.lock_clock_rounded),
        labelText: "New Password",
          suffixIcon: IconButton(
              onPressed: () => setState(() {
                hidePasswordnew = !hidePasswordnew;
              }),
              icon: const Icon(Icons.remove_red_eye_outlined)),
        ),
        validator: (value) {
        if (value!.isEmpty) {
        return "Enter Your New Password";
        }
        // else if (value.length <= 5) {
        // return AppString.passwordValidation;
        // }
        return null;
        },
        ),
              SizedBox(height: 10.0,),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: hidePasswordconfirm,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock_clock_rounded),
                  labelText: "Confirm Password",
                  suffixIcon: IconButton(
                      onPressed: () => setState(() {
                        hidePasswordconfirm = !hidePasswordconfirm;
                      }),
                      icon: const Icon(Icons.remove_red_eye_outlined)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Your Confirm Password";
                  }
                  // else if (value.length <= 5) {
                  // return AppString.passwordValidation;
                  // }
                  return null;
                },
              ),
              SizedBox(height: 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
        ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(150, 50), backgroundColor: Colors.indigoAccent),
        onPressed: () async {
        if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
            User user = Provider.of<UserProvider>(context, listen: false).user;
            user.password = _changePasswordController.text;
            if(user.password != _confirmPasswordController.text){
              showAlertDialog(context, "Match Password!", "you need to enter same passowrd", Colors.red, () { });
              return;
            }

            LoadingDialog.show(context);
            String status = await Provider.of<UserProvider>(context, listen: false).userUpdatePlz(
                username: user.username,
                email: user.email,
                phone: user.phone,
                profile_picture: user.profile_picture,
                address: user.address,
                remark: user.remark,
                password: user.password,
                level: user.level,
                accessToken: user.accessToken,
                wallet_address: user.wallet_address,
                deposit_address: user.deposit_address,
                referCode: user.referCode
            );
            LoadingDialog.hide(context);
        }
        },
        child: Text(
        "Change Password",
        ),
        )
        ])])),
      ),
    );
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

