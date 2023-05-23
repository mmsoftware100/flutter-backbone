import 'package:base/features/presentation/pages/account_page.dart';
import 'package:base/features/presentation/pages/payment_page.dart';
import 'package:base/features/presentation/pages/setting_page.dart';
import 'package:flutter/material.dart';

class UserLoginPage extends StatefulWidget {
  static String routeName = "/UserLogin";
  const UserLoginPage({Key? key}) : super(key: key);

  @override
  State<UserLoginPage> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLoginPage> {

  final bool checkedValue = false;

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
      color: Colors.white,
      child: Column(
        children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.language),
                  Text('EN'),
                ],
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/icons/Untitled-1-01.png')
                        ),
                      ),
                    ),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/icons/Untitled-1-27.PNG')
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/icons/Untitled-1-07.png')
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 170.0),
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          debugPrint('ElevatedButton Clicked');
                          Navigator.pushNamed(context, AccountPage.routeName);
                        },
                        child: Text('Register',style: TextStyle(fontSize: 14),),
                        style: ElevatedButton.styleFrom(shape: StadiumBorder(),backgroundColor: Colors.green, foregroundColor: Colors.white, ),

                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 130),
                child: Row(children: <Widget>[
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 60.0, right: 10.0),
                        child: Divider(
                          color: Colors.black,
                          height: 36,
                        )),
                  ),
                  Text("OR"),
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 60.0),
                        child: Divider(
                          color: Colors.black,
                          height: 36,
                        )),
                  ),
                ]),
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 170.0),
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('ElevatedButton Clicked');
                      Navigator.pushNamedAndRemoveUntil(context, PaymentPage.routeName, (route) => false);
                    },
                    child: Text('Login',style: TextStyle(fontSize: 14,color: Colors.black),),
                    style: ElevatedButton.styleFrom(shape: StadiumBorder(),backgroundColor: Colors.white, foregroundColor: Colors.white, ),

                  ),
                ),
              )
            ],
          ),
         SizedBox(
           height: 5.0,
         ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                    ),
                    child: Column(
                      children: [
                        Container(
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              // Instead of two different colors here I want to have the two other Linear gradients
                              // with each having two other different colors that go from top to bottom
                              Color(0xFFffffff),
                              Color(0xff999999),
                            ],
                            stops: [0.5, 0.5],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            tileMode: TileMode.clamp,
                          ),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/icons/Untitled-1-05.png')
                          ),
                        ),
                        ),
                        Transform.scale(
                          scale: 0.8,
                          child: CheckboxListTile(
                            title: Text("I have to agree to Terms and Privacy and conditions Policy."),
                            value: checkedValue,
                            onChanged: (newValue) {

                            },
                            controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ),
              ],
            )
    );
  }
}
