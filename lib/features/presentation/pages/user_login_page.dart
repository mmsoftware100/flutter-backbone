import 'package:flutter/material.dart';

class UserLoginPageBackup extends StatefulWidget {
  static String routeName = "/UserLoginPageBackup";
  const UserLoginPageBackup({Key? key}) : super(key: key);

  @override
  State<UserLoginPageBackup> createState() => _UserLoginPageBackupState();
}

class _UserLoginPageBackupState extends State<UserLoginPageBackup> {
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 40.0),
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          debugPrint('ElevatedButton Clicked');
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 40.0),
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('ElevatedButton Clicked');
                    },
                    child: Text('Login 3',style: TextStyle(fontSize: 14),),
                    style: ElevatedButton.styleFrom(shape: StadiumBorder(),backgroundColor: Colors.blue, foregroundColor: Colors.white, ),

                  ),
                ),
              )
            ],
          ),

              ],
            )
    );
  }
}

