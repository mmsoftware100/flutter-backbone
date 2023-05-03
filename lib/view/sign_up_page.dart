import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myan_quiz/components/custom_widgets.dart';
import 'package:myan_quiz/components/toggle_button.dart';
import 'package:myan_quiz/utils/global.dart';
import 'package:myan_quiz/view/login_page.dart';
import 'package:myan_quiz/view/profile_page.dart';
import 'package:myan_quiz/view/setting_page.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../utils/loader.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  TextEditingController _txtNameController = TextEditingController();
  TextEditingController _txtEmailController = TextEditingController();
  TextEditingController _txtPhoneNumberController = TextEditingController();
  TextEditingController _txtCityController = TextEditingController();
  TextEditingController _txtAgeController = TextEditingController();
  TextEditingController _txtPasswordController = TextEditingController();
  String userGander = "Male";

  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }

  showSignUpStatusDialog({required dialogType,required title,required description}){
    AwesomeDialog(
      context: context,
      // dialogType: DialogType.warning,
      dialogType:  dialogType,
      borderSide: const BorderSide(
        color: Colors.green,
        width: 2,
      ),
      width: 280,
      buttonsBorderRadius: const BorderRadius.all(
        Radius.circular(2),
      ),
      dismissOnTouchOutside: true,
      dismissOnBackKeyPress: false,
      onDismissCallback: (type) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Try Again'),
          ),
        );
      },
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      title: '$title',
      desc: '$description',
      showCloseIcon: true,
      // btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      backgroundColor: Color(getColorHexFromStr('#48CEAD')),
      body: SafeArea(
        child: // try align widget
        SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    //height: MediaQuery.of(context).size.height / 3.5,
                    width: double.infinity,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: CircleAvatar(
                              backgroundColor: Color(getColorHexFromStr('#9CCB5B')),
                              radius: 60.0,
                              child: ClipRRect(
                                child: Image.asset('assets/images/myan_quiz_logo.png'),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  // height: 300,
                  height: MediaQuery.of(context).size.height / 1.12,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 40
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: makeInput(txtController: _txtNameController,myKeyBoardType: TextInputType.text,label: "Name"),
                        ),
                        makeInput(txtController: _txtEmailController,myKeyBoardType: TextInputType.emailAddress,label: "Email"),
                        makeInput(txtController: _txtPhoneNumberController,myKeyBoardType: TextInputType.phone,label: "Phone Number"),
                        makeInput(txtController: _txtCityController,myKeyBoardType: TextInputType.text,label: "City"),
                        Flexible(
                          // height: 75,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Age", style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87
                                  ),),
                                  SizedBox(height: 5,),
                                  Container(
                                    width: MediaQuery.of(context).size.width/3,
                                    height: 35,
                                    child: TextField(
                                      controller: _txtAgeController,
                                      keyboardType: TextInputType.number,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey)
                                        ),
                                      ),
                                    ),
                                  ),
                                  //SizedBox(height: 16,)

                                ],
                              ),
                              Column(
                                children: [
                                  Text("Gender", style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87
                                  ),),
                                  SizedBox(height: 5,),
                                  Container(
                                    height: 35,
                                    child: ToggleButton(
                                      // width: 300.0,
                                      // height: 60.0,
                                      width: MediaQuery.of(context).size.width/3,
                                      height: 50.0,
                                      toggleBackgroundColor: Colors.white,
                                      toggleBorderColor: (Colors.grey[350])!,
                                      // toggleColor: (Colors.indigo[900])!,
                                      toggleColor: Color(getColorHexFromStr('#9CCB5B')),
                                      activeTextColor: Colors.white,
                                      inactiveTextColor: Colors.grey,
                                      leftDescription: 'ကျား',
                                      rightDescription: 'မ',
                                      onLeftToggleActive: () {
                                        setState(() {
                                          userGander == "Male";
                                        });
                                        print('left toggle activated');
                                      },
                                      onRightToggleActive: () {
                                        setState(() {
                                          userGander == "Female";
                                        });
                                        print('right toggle activated');
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        makeInput(txtController: _txtPasswordController,myKeyBoardType: TextInputType.text,label: "Password"),
                        MaterialButton(
                          minWidth: double.infinity,
                          // minWidth: MediaQuery.of(context).size.width/1.5,
                          height:40,
                          onPressed: ()async{
                            if(_txtNameController.text != ""
                            && _txtEmailController.text != ""
                            && _txtPhoneNumberController.text != ""
                            && _txtCityController.text != ""
                            && _txtAgeController.text != ""
                            && _txtPasswordController.text != ""
                            ){

                              // show loading indicator
                              Dialogs.showLoadingDialog(context, _keyLoader);

                              bool status = await Provider.of<UserProvider>(context, listen:false).userRegisterPlz(
                                  name: _txtNameController.text,
                                  email:_txtEmailController.text,
                                  password:_txtPasswordController.text,
                                  phone:_txtPhoneNumberController.text,
                                  city:_txtCityController.text,
                                  age:_txtAgeController.text,
                                  gender:userGander
                              );

                              // hide loading indicator
                              Navigator.pop(context);

                              if(status == true){
                                bool loginStatus = await Provider.of<UserProvider>(context, listen:false).loginWithEmailPlz(email: _txtEmailController.text, password: _txtPasswordController.text);
                                print("My Login status is "+status.toString());
                                if(loginStatus == true){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
                                }
                                else{
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                                }
                              }
                              else{
                                showSignUpStatusDialog(dialogType: DialogType.info,title: "Sorry",description: "Something wrong");
                              }
                            }
                            else{
                              showSignUpStatusDialog(dialogType: DialogType.info,title: "Sorry",description: "You need to fill all data");
                            }


                          },
                          // color: Colors.indigoAccent[400],
                          color: Color(getColorHexFromStr('#FFCE55')),
                          shape: RoundedRectangleBorder(
                            // side: BorderSide(
                            //   color: Colors.black,
                            // ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text("Sign up",style: TextStyle(
                            fontWeight: FontWeight.w600,fontSize: 16,
                            // color: Colors.white70

                          ),),),
                        Row(children: <Widget>[
                          Expanded(
                            child: new Container(
                                margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                                child: Divider(
                                  color: Colors.black,
                                  height: 36,
                                )),
                          ),
                          Text("OR"),
                          Expanded(
                            child: new Container(
                                margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                                child: Divider(
                                  color: Colors.black,
                                  height: 36,
                                )),
                          ),
                        ]),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              CustomWidgets.socialButtonCircle(
                                  googleColor, FontAwesomeIcons.googlePlusG,
                                  iconColor: Colors.white, onTap: () {
                              }),
                              // CustomWidgets.socialButtonCircle(
                              //     whatsappColor, FontAwesomeIcons.whatsapp,
                              //     iconColor: Colors.white, onTap: () {
                              // }),
                              CustomWidgets.socialButtonCircle(
                                  appleColor,FontAwesomeIcons.apple,
                                  iconColor: Colors.grey, onTap: () {
                              }),
                              CustomWidgets.socialButtonCircle(
                                  facebookColor, FontAwesomeIcons.facebookF,
                                  iconColor: Colors.white, onTap: () {
                              }),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?"),
                            InkWell(
                              child: Text("Log in",style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.red
                              ),),
                              onTap: (){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget makeInput({required txtController,required myKeyBoardType,label, obsureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87
        ),),
        SizedBox(height: 5,),
        Container(
          height: 35,
          child: TextField(
            controller: txtController,
            keyboardType: myKeyBoardType,
            obscureText: obsureText,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)
              ),
            ),
          ),
        ),
        SizedBox(height: 16,)

      ],
    );
  }


}
