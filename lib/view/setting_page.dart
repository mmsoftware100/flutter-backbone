import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:myan_quiz/view/leader_board_page.dart';
import 'package:myan_quiz/view/splash_screen_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

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
      // backgroundColor: Colors.transparent,
      backgroundColor: Color(getColorHexFromStr('#48CEAD')),
      body: SafeArea(
        child: // try align widget
        SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:90),
                  child: Container(
                    // height: 300,
                    height: double.infinity,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                        // BorderRadius.all(Radius.circular(30))
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 30,),
                          SizedBox(height: 10,),
                          ListTile(
                            leading: Icon(Icons.account_circle,color: Color(getColorHexFromStr('#48CEAD')),),
                            title: Text("Khin Wint Wah",
                              // style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.monetization_on,color: Color(getColorHexFromStr('#48CEAD')),),
                            title: Text("10.5 K",
                              // style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.local_post_office,color: Color(getColorHexFromStr('#48CEAD')),),
                            title: Text("MQ_007",
                              // style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.assessment,color: Color(getColorHexFromStr('#48CEAD')),),
                            title: Text("Level",
                              // style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaderBoardPage()));
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.wifi_protected_setup,color: Color(getColorHexFromStr('#48CEAD')),),
                            title: Text("Exchange",
                              // style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.comment_bank,color: Color(getColorHexFromStr('#48CEAD')),),
                            title: Text("About",
                              // style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.shield,color: Color(getColorHexFromStr('#48CEAD')),),
                            title: Text("Terms and conditions",
                              // style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.logout,color: Color(getColorHexFromStr('#48CEAD')),),
                            title: Text("Logout",
                              // style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),
                            ),
                            onTap: (){
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.warning,
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
                                      content: Text('Log out $type'),
                                    ),
                                  );
                                },
                                headerAnimationLoop: false,
                                animType: AnimType.bottomSlide,
                                title: 'Attention',
                                desc: 'Are you sure to log out ?',
                                showCloseIcon: true,
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (BuildContext context) => SplashScreenPage()),
                                      ModalRoute.withName('/')
                                  );
                                },
                              ).show();
                            },
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 5.5,
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
                              child: Image.asset('assets/images/girl_profile.png'),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                          ),
                        ),
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
}
