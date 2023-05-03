import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myan_quiz/providers/user_provider.dart';
import 'package:myan_quiz/view/exchange/bills/bills_page.dart';
import 'package:myan_quiz/view/exchange/bills/choose_operator_for_bill_page.dart';
import 'package:myan_quiz/view/match_page.dart';
import 'package:myan_quiz/view/playing_type_choose_page.dart';
import 'package:myan_quiz/view/setting_page.dart';
import 'package:myan_quiz/view/status_page.dart';
import 'package:myan_quiz/view/test_page.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  int myCurrentBottomNavigationBarItemIndex = 0;
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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      backgroundColor: Color(getColorHexFromStr('#48CEAD')),
      body: myCurrentBottomNavigationBarItemIndex == 0 ? SafeArea(
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
                    height: MediaQuery.of(context).size.height / 1.05,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        // BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                      BorderRadius.all(Radius.circular(30))
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 30,),

                          // Text("Khin Wint Wah",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          Text(Provider.of<UserProvider>(context,listen: true).user.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

                          SizedBox(height: 10,),
                          Card(
                            elevation: 5,
                            color: Color(getColorHexFromStr('#48CEAD')),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Icon(Icons.monetization_on,color: Colors.orange,),
                                      SizedBox(height: 5,),
                                      Text("Coins"),
                                      SizedBox(height: 5,),
                                      // Text("360",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)
                                      Text(Provider.of<UserProvider>(context,listen: true).user.userStatistics.coinCurrent.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)
                                    ],
                                  ),
                                  Container(
                                    height: 70,
                                      width: 2, color: Colors.white),
                                  Column(
                                    children: [
                                      Icon(Icons.monetization_on,color: Colors.orange,),
                                      SizedBox(height: 5,),
                                      Text("Rank"),
                                      SizedBox(height: 5,),

                                      // Text("ပညာသင်",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),)
                                      Text(Provider.of<UserProvider>(context,listen: true).user.userStatistics.rank,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),),

                                    ],
                                  ),
                                  Container(
                                      height: 70,
                                      width: 2, color: Colors.white),
                                  Column(
                                    children: [
                                      Icon(Icons.monetization_on,color: Colors.orange,),
                                      SizedBox(height: 5,),
                                      Text("Levels"),
                                      SizedBox(height: 5,),

                                      // Text("360",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)
                                      Text(Provider.of<UserProvider>(context,listen: true).user.userStatistics.level,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                    child: Text("Gifts"),
                                  onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ChooseOperatorBillPage()));
                                  },
                                ),
                                InkWell(
                                    child: Text("Status"),
                                  onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>StatusPage()));
                                  },
                                ),
                                InkWell(
                                    child: Text("Matchs"),
                                  onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MatchPage()));
                                  },
                                ),
                              ],
                            ),
                          ),

                          Card(
                            elevation: 5,
                            color: Color(getColorHexFromStr('#48CEAD')),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Level"),
                                      // Text("22"),
                                      Text(Provider.of<UserProvider>(context,listen: true).user.userStatistics.nextLevel.toString()),

                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 20),
                                    width: 300,
                                    height: 20,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      child: LinearProgressIndicator(
                                        // value: 0.7,
                                        value: double.parse(Provider.of<UserProvider>(context,listen: true).user.userStatistics.levelProgress.toString()),
                                        valueColor: AlwaysStoppedAnimation<Color>(
                                            // Color(0xff00ff00)
                                            Color(getColorHexFromStr('#FFCE55'))
                                        ),
                                        backgroundColor: Color(0xffD6D6D6),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text("Questions",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                  ),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text("Total"),
                                                Text("Passed"),
                                                Text("Fails"),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            height: 5,
                                            color: Colors.black,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(Provider.of<UserProvider>(context,listen: true).user.userStatistics.questionTotal.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                                Text(Provider.of<UserProvider>(context,listen: true).user.userStatistics.questionPassed.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                                Text(Provider.of<UserProvider>(context,listen: true).user.userStatistics.questionFailed.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Text("Coins",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                  ),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text("Earned"),
                                                Text("Changed"),
                                                Text("Current"),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            height: 5,
                                            color: Colors.black,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(Provider.of<UserProvider>(context,listen: true).user.userStatistics.coinTotal.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                                Text(Provider.of<UserProvider>(context,listen: true).user.userStatistics.coinExchanged.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                                Text(Provider.of<UserProvider>(context,listen: true).user.userStatistics.coinCurrent.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  MaterialButton(
                                    minWidth: double.infinity,
                                    // minWidth: MediaQuery.of(context).size.width/1.5,
                                    height:40,
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayingTypeChoosePage()));
                                    },
                                    // color: Colors.indigoAccent[400],
                                    color: Color(getColorHexFromStr('#FFCE55')),
                                    shape: RoundedRectangleBorder(
                                      // side: BorderSide(
                                      //   color: Colors.black,
                                      // ),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Text("Game Play",style: TextStyle(
                                      fontWeight: FontWeight.w600,fontSize: 16,
                                      // color: Colors.white70

                                    ),),),

                                ],
                              ),
                            ),
                          )
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
      ) :  myCurrentBottomNavigationBarItemIndex == 2 ? SettingPage(): BillsPage(),
      bottomNavigationBar: new Container(
        height: 80.0,
        color: Colors.white,
        padding: new EdgeInsets.only(top: 20.0),
        child: new Theme(

          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.white,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Colors.red,
              bottomAppBarColor: Colors.green,
              textTheme: Theme
                  .of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.grey))), // sets the inactive color of the `BottomNavigationBar`
          child:
          new BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Color(getColorHexFromStr('#48CEAD')),
              currentIndex:myCurrentBottomNavigationBarItemIndex ,
              onTap: (v){
                setState(() {
                  myCurrentBottomNavigationBarItemIndex = v;
                });
                // if(myCurrentBottomNavigationBarItemIndex == 2){
                //   Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingPage()));
                // }
              },
              items: [
                BottomNavigationBarItem(
                    icon: new Icon(Icons.home),
                    label: 'Home',
                    backgroundColor: Colors.black,
                ),
                // BottomNavigationBarItem(
                //   icon: new Icon(Icons.search),
                //   label: 'Search',
                // ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bookmark_border),
                    label: 'Center'
                ),

                // BottomNavigationBarItem(
                //     icon: Icon(Icons.settings),
                //     label: 'Setting'
                // ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.more_horiz),
                    label: 'More'
                ),

              ]),
        ),
      ),
    );
  }

}
