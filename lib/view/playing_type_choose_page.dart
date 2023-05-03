import 'package:flutter/material.dart';
import 'package:myan_quiz/providers/game_play_provider.dart';
import 'package:myan_quiz/providers/user_provider.dart';
import 'package:myan_quiz/utils/global.dart';
import 'package:myan_quiz/view/categories_chosen_page.dart';
import 'package:provider/provider.dart';

import '../utils/loader.dart';

class PlayingTypeChoosePage extends StatefulWidget {
  const PlayingTypeChoosePage({Key? key}) : super(key: key);

  @override
  _PlayingTypeChoosePageState createState() => _PlayingTypeChoosePageState();
}

class _PlayingTypeChoosePageState extends State<PlayingTypeChoosePage> {

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

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
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // height: 300,
                  height: MediaQuery.of(context).size.height / 3.54,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
                      // BorderRadius.all(Radius.circular(30))
                  ),
                 child: Image.asset("assets/images/question_choose.jpg"),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("ကစားမည့်ပုံစံကိုရွေးချယ်ပါ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width/1.5,
                    child: InkWell(
                      child: Card(
                        child: Center(child: Text("အလွတ်တမ်းကစားမည်")),
                      ),
                      onTap: ()async{

                        // show loading indicator
                        Dialogs.showLoadingDialog(context, _keyLoader);

                        String accessToken = Provider.of<UserProvider>(context, listen: false).user.accessToken;
                        bool status = await Provider.of<GamePlayProvider>(context, listen:false).selectCategories(accessToken: accessToken);

                        // hide loading indicator
                        Navigator.pop(context);

                        if(status == true){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoriesChosenPage()));
                        }
                      },
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width/1.5,
                    child: InkWell(
                      child: Card(
                        child: Center(child: Text("မစ်ရှင်ဖြင့်ကစားမည်")),
                      ),
                      onTap: ()async{

                        // show loading indicator
                        Dialogs.showLoadingDialog(context, _keyLoader);

                        String accessToken = Provider.of<UserProvider>(context, listen: false).user.accessToken;
                        bool status = await Provider.of<GamePlayProvider>(context, listen:false).selectCategories(accessToken: accessToken);

                        // hide loading indicator
                        Navigator.pop(context);

                        if(status == true){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoriesChosenPage()));
                        }

                      },
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width/1.5,
                    child: InkWell(
                      child: Card(
                        child: Center(child: Text("စိန်ခေါ်ကစားမည်")),
                      ),
                      onTap: ()async{

                        // show loading indicator
                        Dialogs.showLoadingDialog(context, _keyLoader);

                        String accessToken = Provider.of<UserProvider>(context, listen: false).user.accessToken;
                        bool status = await Provider.of<GamePlayProvider>(context, listen:false).selectCategories(accessToken: accessToken);

                        // hide loading indicator
                        Navigator.pop(context);

                        if(status == true){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoriesChosenPage()));
                        }

                      },
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
      /*
      bottomNavigationBar:  BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      fixedColor: Color(0xff2398C3),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      // currentIndex: snapshot.data.index,
      // onTap: _bottomNavBarBloc.pickItem,
      items: [
        BottomNavigationBarItem(
          title: Text('Home'),
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          title: Text('Browse'),
          icon: Icon(Icons.assessment),
        ),
        BottomNavigationBarItem(
          title: Text('Icon'),
          icon: Container(
            child: FlutterLogo(
              size: 35.0,
            ),
          ),
        ),
        BottomNavigationBarItem(
          title: Text('Favorites'),
          icon: Icon(Icons.account_circle_outlined),
        ),
        BottomNavigationBarItem(
          title: Text('Settings'),
          icon: Icon(Icons.settings),
        ),
      ],
    )

       */
    );
  }
}
