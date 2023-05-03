import 'package:flutter/material.dart';
import 'package:myan_quiz/view/login_page.dart';
import 'package:myan_quiz/view/sign_up_page.dart';

class PreLoginPage extends StatefulWidget {
  const PreLoginPage({Key? key}) : super(key: key);

  @override
  _PreLoginPageState createState() => _PreLoginPageState();
}

class _PreLoginPageState extends State<PreLoginPage> {

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(getColorHexFromStr('#48CEAD')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            //padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Let's get started!",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.white),
                    ),
                    // SizedBox(height: 20,),
                    Container(
                      height: MediaQuery.of(context).size.height/2.5,
                      decoration: BoxDecoration(
                          image:DecorationImage(image: AssetImage('assets/images/myan_quiz_logo.png'))
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "သင့်တစ်နေ့တာအတွက် ပညာ နဲ့ ဥစ္စာ ကို Myan Quiz မှာရှာပါ။",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,color: Colors.white,),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        // minWidth: double.infinity,
                        minWidth: MediaQuery.of(context).size.width/1.5,
                        height:40,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
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
                    ),
                    // SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? "),
                          InkWell(
                            child: Text("Login", style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              color: Colors.red
                            ),),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                            },
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomWidgets {
  static Widget socialButtonCircle(color, icon, {iconColor, Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 50,
            height: 50,
            // padding: const EdgeInsets.all(20.0),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
              color: color,
            ),
            child: Center(
              child: Icon(
                icon,
                color: iconColor,
              ),
            )),
      ), //
    );
  }
}
