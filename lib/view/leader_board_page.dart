import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myan_quiz/utils/global.dart';

class LeaderBoardPage extends StatefulWidget {
  const LeaderBoardPage({Key? key}) : super(key: key);

  @override
  _LeaderBoardPageState createState() => _LeaderBoardPageState();
}

class _LeaderBoardPageState extends State<LeaderBoardPage> {

  List itemList = [
    {"name":"Aung Aung","point":"10 K"},
    {"name":"Maung Maung","point":"10 K"},
    {"name":"Kyaw Kyaw","point":"10 K"},
    {"name":"Nyi Nyi","point":"10 K"},
    {"name":"Aung Aung","point":"10 K"},
    {"name":"Maung Maung","point":"10 K"},
    {"name":"Kyaw Kyaw","point":"10 K"},
    {"name":"Nyi Nyi","point":"10 K"},
    {"name":"Aung Aung","point":"10 K"},
    {"name":"Maung Maung","point":"10 K"},
    {"name":"Kyaw Kyaw","point":"10 K"},
    {"name":"Nyi Nyi","point":"10 K"},
  ];

  bool btnToday = false;
  bool btnMonth = false;
  bool allTime = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      btnMonth = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //   backgroundColor: Color(getColorHexFromStr('#48CEAD')),
        body: SafeArea(
          child: // try align widget
          SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // height: 300,
                  height: MediaQuery.of(context).size.height / 2,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.tealAccent,
                      borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
                    // BorderRadius.all(Radius.circular(30))
                  ),
                  child: Column(
                    children: [
                      Text("Leader Board",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            // color: btnToday == true ? Colors.orangeAccent : null,
                            child:Text("Today",
                                style: TextStyle(color: btnToday == true ? Colors.white : Colors.black,)),
                              onPressed: (){

                              setState(() {
                                btnToday = true;
                                btnMonth = false;
                                allTime = false;
                              });
                          }),
                          ElevatedButton(
                              //color: btnMonth == true ? Colors.orangeAccent : null,
                              child:Text("Month",
                                  style: TextStyle(color: btnMonth == true ? Colors.white : Colors.black,)),
                              onPressed: (){
                                setState(() {
                                  btnToday = false;
                                  btnMonth = true;
                                  allTime = false;
                                });
                          }),
                          ElevatedButton(
                              //color: allTime == true ? Colors.orangeAccent : null,
                              child:Text("All Time",
                              style: TextStyle(color: allTime == true ? Colors.white : Colors.black,)),
                              onPressed: (){
                                setState(() {
                                  btnToday = false;
                                  btnMonth = false;
                                  allTime = true;
                                });
                          }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 100.0,
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green
                                  ),
                                  child:CircleAvatar(
                                    backgroundColor: Color(getColorHexFromStr('#F7F7F7')),
                                    radius: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.all(28.0),
                                      child: Image.asset('assets/images/profiel.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            child: Card(
                              color: Color(getColorHexFromStr('#5AAF9A')),
                              child: Center(child: Text("2",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 150,
                            child: Card(
                              color: Color(getColorHexFromStr('#1A8B6F')),
                              child: Center(child: Text("1",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            child: Card(
                              elevation: 3,
                              color: Color(getColorHexFromStr('#46907E')),
                              child: Center(child: Text("3",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 500,
                  child: ListView(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    children: itemList.map((e) {
                      var index = itemList.indexOf(e);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: index %2 == 0?Colors.grey:null,
                          // child: Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     Padding(
                          //       padding: const EdgeInsets.all(8.0),
                          //       child: Text((index+1).toString()),
                          //     ),
                          //     Padding(
                          //       padding: const EdgeInsets.all(8.0),
                          //       child: Row(
                          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //         children: [
                          //           Container(
                          //             height: 50.0,
                          //             width: 50.0,
                          //             decoration: BoxDecoration(
                          //                 shape: BoxShape.circle,
                          //                 color: Colors.green
                          //             ),
                          //             child:CircleAvatar(
                          //               backgroundColor: Color(getColorHexFromStr('#F7F7F7')),
                          //               radius: 30,
                          //               child: Padding(
                          //                 padding: const EdgeInsets.all(8.0),
                          //                 child: Image.asset('assets/images/profiel.png'),
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //     Text(e['name']),
                          //     Text(e['point'])
                          //   ],
                          // )
                          child:ListTile(
                            leading: Padding(
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
                            title: Text(e['name']),
                            trailing: Text(e['point']),
                          )
                        ),
                      );
                    }).toList(),
                  ),
                )



              ],
            ),
          ),
        ),
    );

  }
}
