import 'package:flutter/material.dart';
import 'package:myan_quiz/utils/global.dart';
import 'package:myan_quiz/view/exchange/gifts/exchage_page_gift.dart';
import 'package:myan_quiz/view/spin_whell_page.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({Key? key}) : super(key: key);

  @override
  _MatchPageState createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
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
                    height: MediaQuery.of(context).size.height / 1.2,
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
                          Text("Khin Wint Wah",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
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
                                      Text("360",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)
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
                                      Text("ပညာသင်",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),)
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
                                      Text("360",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)
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
                                Text("Gifts"),
                                Text("Status"),
                                Text("Matchs"),
                              ],
                            ),
                          ),

                          Card(
                            elevation: 5,
                            color: Color(getColorHexFromStr('#48CEAD')),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 390,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Level"),
                                        Text("22"),

                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 20),
                                      width: 300,
                                      height: 20,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        child: LinearProgressIndicator(
                                          value: 0.7,
                                          valueColor: AlwaysStoppedAnimation<Color>(
                                            // Color(0xff00ff00)
                                              Color(getColorHexFromStr('#FFCE55'))
                                          ),
                                          backgroundColor: Color(0xffD6D6D6),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text("Recent Matchs",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 300,
                                        child: ListView(
                                          shrinkWrap: true,
                                          physics: ScrollPhysics(),
                                          children: [

                                            Card(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Container(
                                                        height: 50.0,
                                                        width: 50.0,
                                                        decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            color: Colors.green
                                                        ),
                                                        child:CircleAvatar(
                                                          backgroundColor: Color(getColorHexFromStr('#F7F7F7')),
                                                          radius: 30,
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Image.asset('assets/images/profiel.png'),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Text("VS"),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Container(
                                                        height: 50.0,
                                                        width: 50.0,
                                                        decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            color: Colors.green
                                                        ),
                                                        child:CircleAvatar(
                                                          backgroundColor: Color(getColorHexFromStr('#F7F7F7')),
                                                          radius: 30,
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Image.asset('assets/images/profiel.png'),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Card(
                                                      color: Color(getColorHexFromStr('#FFCE55')),
                                                      child: Text("+1000 P",style: TextStyle(color: Colors.white),),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Card(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Container(
                                                            height: 50.0,
                                                            width: 50.0,
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape.circle,
                                                                color: Colors.green
                                                            ),
                                                            child:CircleAvatar(
                                                              backgroundColor: Color(getColorHexFromStr('#F7F7F7')),
                                                              radius: 30,
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Image.asset('assets/images/profiel.png'),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Text("VS"),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Container(
                                                            height: 50.0,
                                                            width: 50.0,
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape.circle,
                                                                color: Colors.green
                                                            ),
                                                            child:CircleAvatar(
                                                              backgroundColor: Color(getColorHexFromStr('#F7F7F7')),
                                                              radius: 30,
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Image.asset('assets/images/profiel.png'),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Card(
                                                      color: Color(getColorHexFromStr('#FFCE55')),
                                                      child: Text("+1000 P",style: TextStyle(color: Colors.white),),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Card(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Container(
                                                            height: 50.0,
                                                            width: 50.0,
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape.circle,
                                                                color: Colors.green
                                                            ),
                                                            child:CircleAvatar(
                                                              backgroundColor: Color(getColorHexFromStr('#F7F7F7')),
                                                              radius: 30,
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Image.asset('assets/images/profiel.png'),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Text("VS"),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Container(
                                                            height: 50.0,
                                                            width: 50.0,
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape.circle,
                                                                color: Colors.green
                                                            ),
                                                            child:CircleAvatar(
                                                              backgroundColor: Color(getColorHexFromStr('#F7F7F7')),
                                                              radius: 30,
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Image.asset('assets/images/profiel.png'),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Card(
                                                      color: Color(getColorHexFromStr('#FFCE55')),
                                                      child: Text("+1000 P",style: TextStyle(color: Colors.white),),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),



                                          ],
                                        ),
                                      ),
                                    ),
                                    MaterialButton(
                                      minWidth: double.infinity,
                                      // minWidth: MediaQuery.of(context).size.width/1.5,
                                      height:40,
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Roulette()));
                                      },
                                      // color: Colors.indigoAccent[400],
                                      color: Color(getColorHexFromStr('#FFCE55')),
                                      shape: RoundedRectangleBorder(
                                        // side: BorderSide(
                                        //   color: Colors.black,
                                        // ),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Text("Match Now",style: TextStyle(
                                        fontWeight: FontWeight.w600,fontSize: 16,
                                        // color: Colors.white70

                                      ),),),
                                  ],
                                ),
                              )
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
      ),
    );

  }
}
