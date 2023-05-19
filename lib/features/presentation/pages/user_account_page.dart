import 'package:base/core/util/format_number.dart';
import 'package:base/features/presentation/components/form_elements/our_drawer.dart';
import 'package:base/features/presentation/components/form_elements/our_text_input.dart';
import 'package:base/features/presentation/components/form_elements/our_submit_button.dart';
import 'package:base/features/presentation/pages/user_login_test_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/entities/user.dart';
import '../providers/user_provider.dart';

class UserAccountPage extends StatefulWidget {
  static String routeName = "/UserAccountPage";
  const UserAccountPage({Key? key}) : super(key: key);

  @override
  State<UserAccountPage> createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Provider.of<UserProvider>(context,listen: true).user.accessToken == User.sample().accessToken ?
        _loginFirstWidget() :
        SingleChildScrollView(
            child: _mainWidget(Provider.of<UserProvider>(context,listen: true).user)
        ),
      ),
      drawer: MyDrawer(),
    );
  }

  Widget _loginFirstWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: double.infinity,),
        Text("Login to see your points"),
        SizedBox(height: 8.0,),
        OurSubmitButton(callback: (){
          Navigator.pushNamed(context, UserLoginTestPage.routeName);
        }, text: "Login",
          width: 0.8,
        )
      ],
    );
  }
  Widget _mainWidget(User user){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
                width: double.infinity,
                // color: Colors.green,
                child: Text(""),
            ),
          ],
        ),
        Text("iCoffer", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        ListTile(
          leading: Icon(Icons.person_outline),
          title: Text("Name"),
          trailing: Text(user.name),
        ),

        ListTile(
          leading: Icon(Icons.email_outlined),
          title: Text("Email"),
          trailing: Text(user.email),
        ),

        ListTile(
          leading: Icon(Icons.sms_outlined),
          title: Text("Facebook"),
          trailing: Text("𝓲𝓒𝓸𝓯𝓯𝓮𝓻", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red)),
          onTap: _openFacebook,
          /*
          onTap: () async{
            // to do open telegram
            try{
              String facebook = "https://www.facebook.com/icoffer";

              // 100089259545107
              String page = "fb://me/100089259545107";
              await canLaunch(facebook) ? await launch(facebook) : throw 'Could not launch $facebook';


              /*
              try{
                bool launched = await launch(page);
                if(!launched){
                  await launch(facebook);
                }
              }
              catch(e){
                await canLaunch(facebook) ? await launch(facebook) : throw 'Could not launch $facebook';
                // await launch(facebook);
              }

               */

            }
            catch(exp, stackTrace){
              print(exp);
              print(stackTrace);
            }
          },

           */
        ),
        /*
        Divider(),
        NavigationDrawerItem(
          title: "Home Page",
          callback: () {
            Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName, (route) => false);
          },
          iconData: Icons.home,
        ),
        NavigationDrawerItem(
          title: "Logout",
          callback: () {
            // Navigator.pop(context);
            // TODO: clear user data in user provider
            Provider.of<UserProvider>(context, listen: false).logout();
            Navigator.pushNamed(context, UserLoginPage.routeName);
          },
          iconData: Icons.logout,
        )

         */
      ],
    );
  }


  void _openFacebook() async{
    /* numeric value ကို https://lookup-id.com/ မှာ ရှာပါ */
    // String fbProtocolUrl = "fb://page/100089259545107";
    String fallbackUrl = "https://m.facebook.com/icoffer";
    try {
      // bool launched = await launch(fbProtocolUrl, forceSafariVC: false);
      bool launched = await launch(fallbackUrl, forceSafariVC: false);
      print("launching..."+fallbackUrl);
      if (!launched) {
        print("can't launch");
        await launch(fallbackUrl, forceSafariVC: false);
      }
    } catch (e) {
      print("can't launch exp "+e.toString());
      await launch(fallbackUrl, forceSafariVC: false);
    }
  }


}

