import 'package:base/features/data/models/user_model.dart';
import 'package:base/features/domain/entities/app_language.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/presentation/pages/aboutus_page.dart';
import 'package:base/features/presentation/pages/changepassword_page.dart';
import 'package:base/features/presentation/providers/language_provider.dart';
import 'package:base/features/presentation/providers/user_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  static String routeName = "/SettingPage";
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  User user = User.sample();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = Provider.of<UserProvider>(context, listen: false).user;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("FUMO",style: TextStyle(color: Colors.white),),),
      body: SafeArea(
        child: _mainWidget(),
      ),
    );
  }

  Widget _languageDropdown(){
    return DropdownButton<String>(
      value: Provider.of<LanguageProvider>(context, listen: true).appLanguage.code,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        switch (value) {
          case 'en':
            Provider.of<LanguageProvider>(context, listen: false).setAppLanguage(AppLanguage(name: "English", code: "en", flag: "https://fumoinvest.org/img/eng_flag.png"));
            context.setLocale(Locale('en'));
            break;
          case 'ch':
            Provider.of<LanguageProvider>(context, listen: false).setAppLanguage(AppLanguage(name: "China", code: "ch", flag: "https://fumoinvest.org/img/ch_flag.png"));
            context.setLocale(Locale('zh'));
            break;
          case 'jp':
            Provider.of<LanguageProvider>(context, listen: false).setAppLanguage(AppLanguage(name: "Japan", code: "jp", flag: "https://fumoinvest.org/img/jp_flag.png"));
            context.setLocale(Locale('ja'));
            break;
          default:

        }

      },
      items: Provider.of<LanguageProvider>(context, listen: true).appLanguageList.map<DropdownMenuItem<String>>((AppLanguage appLanguage) {
        return DropdownMenuItem<String>(
          value: appLanguage.code,
          child: Text(appLanguage.name,style: TextStyle(color: Colors.black),),
        );
      }).toList(),
    );
  }

  Widget _mainWidget(){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0,right: 15.0),
            child: Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent,
                    blurRadius: 10.0, // soften the shadow
                    spreadRadius: 0.0, //extend the shadow
                    offset: Offset(
                      0.0, // Move to right 10  horizontally
                      0.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.settings,size: 30.0, color: Colors.blueAccent,),
                  SizedBox(width: 10.0,),
                  Text('Setting',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.blueAccent),).tr(),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 15.0,right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.account_circle,size: 100,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30,),
                    Text(user.username,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    Text("Online",style: TextStyle(fontSize: 10),)
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 60.0,right: 15.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.email,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  Text("Email",style: TextStyle(fontSize: 10,fontStyle: FontStyle.italic),)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60.0,right: 15.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, ChangePassword.routeName);
                    },
                      child: Text("Change Password",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60.0,right: 15.0,top: 30.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: (){
                        //Navigator.pushNamed(context, ChangePassword.routeName);
                      },
                      child: Text("Language",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                  // Expanded(child: Container()),
                  SizedBox(width: 100.0,),
                  Center(child: _languageDropdown())

                ],
              ),
            ),
          ),
          SizedBox(height: 60.0,),
          Padding(
            padding: const EdgeInsets.only(left: 60.0,right: 30.0),
            child: Divider(thickness: 1,),
          ),
          SizedBox(height: 30.0,),
          // Padding(
          //   padding: const EdgeInsets.only(left: 60.0,right: 15.0),
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     height: 20,
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text("Notification and Sounds",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          //
          //       ],
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 60.0,right: 15.0,top:20),
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     height: 20,
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text("Language",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          //
          //       ],
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 60.0,right: 15.0,top:20),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Privacy Policy",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60.0,right: 15.0,top:20),
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, AboutUsPage.routeName);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("About Us",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
