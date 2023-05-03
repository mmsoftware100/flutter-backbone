import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myan_quiz/providers/game_play_provider.dart';
import 'package:myan_quiz/providers/user_provider.dart';
import 'package:myan_quiz/view/profile_page.dart';
import 'package:myan_quiz/view/setting_page.dart';
import 'package:provider/provider.dart';

import '../domain/entities/answer.dart';
import '../domain/entities/user.dart';

class QuestionPageAnswer extends StatefulWidget {
  const QuestionPageAnswer({Key? key}) : super(key: key);

  @override
  _QuestionPageAnswerState createState() => _QuestionPageAnswerState();
}

class _QuestionPageAnswerState extends State<QuestionPageAnswer> {

  int? selectedIndex;
  bool hasBeenSelected = false;

  List amount = ['၆ ဦး','၅ ဦး','၇ ဦး','၄ ဦး'];
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

  CountDownController _controller = CountDownController();
  int _duration = 20;

  bool shouldShowResult = false;
  bool resultIsTrue = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Provider.of<GamePlayProvider>(context, listen: true).question.correctAnswer;

  }

   Future<bool> wantToBack(BuildContext context) {
    debugPrint("wantToBack");
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
            content: Text('Dismissed by $type'),
          ),
        );
      },
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      title: 'SORRY',
      desc: 'You have to answer',
      showCloseIcon: true,
      // btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();

    return Future.value(false);
  }

  Widget _answerCard({required Answer answer, required bool correct}){
    return Card();
  }
  @override
  Widget build(BuildContext context) {

    ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () => wantToBack(context),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Container(
                    // height: 300,
                    height: MediaQuery.of(context).size.height / 3.54,
                    width: double.infinity,
                    decoration:  BoxDecoration(
                        color: Color(getColorHexFromStr('#48CEAD')),
                        borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
                      // BorderRadius.all(Radius.circular(30))
                    ),
                    // child: Image.asset("assets/images/question_choose.jpg"),
                  ),
                  ListView(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height/7,
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 38.0,right: 38.0,top: 70),
                            child: Card(
                              elevation: 3,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 60,
                                              height: 10,
                                              color: Colors.red,
                                            ),
                                            Text("4",style: TextStyle(fontSize: 18),)
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("7",style: TextStyle(fontSize: 18),),
                                            Container(
                                              width: 60,
                                              height: 10,
                                              color: Colors.green,
                                            ),

                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Text("Question: 11/20",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(Provider.of<GamePlayProvider>(context,listen:true).question.name,
                                    // child: Text("အိုးစားဖက်တွင် စုစုပေါင်း _____________ ဦး ပါဝင်သည်။",
                                      style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: Center(
                              child: CircularCountDownTimer(
                                // Countdown duration in Seconds.
                                duration: _duration,

                                // Countdown initial elapsed Duration in Seconds.
                                initialDuration: 0,

                                // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
                                controller: _controller,

                                // Width of the Countdown Widget.
                                width: MediaQuery.of(context).size.width / 4,

                                // Height of the Countdown Widget.
                                height: MediaQuery.of(context).size.height / 4,

                                // Ring Color for Countdown Widget.
                                ringColor: Colors.grey,

                                // Ring Gradient for Countdown Widget.
                                ringGradient: null,

                                // Filling Color for Countdown Widget.
                                fillColor: Colors.purpleAccent,

                                // Filling Gradient for Countdown Widget.
                                fillGradient: null,

                                // Background Color for Countdown Widget.
                                backgroundColor: Colors.purple[500],

                                // Background Gradient for Countdown Widget.
                                backgroundGradient: null,

                                // Border Thickness of the Countdown Ring.
                                strokeWidth: 20.0,

                                // Begin and end contours with a flat edge and no extension.
                                strokeCap: StrokeCap.round,

                                // Text Style for Countdown Text.
                                textStyle: TextStyle(
                                    fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),

                                // Format for the Countdown Text.
                                textFormat: CountdownTextFormat.S,

                                // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
                                // isReverse: false,
                                isReverse: true,

                                // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
                                // isReverseAnimation: false,
                                isReverseAnimation: true,

                                // Handles visibility of the Countdown Text.
                                isTimerTextShown: true,

                                // Handles the timer start.
                                // autoStart: false,
                                autoStart: true,

                                // This Callback will execute when the Countdown Starts.
                                onStart: () {
                                  // Here, do whatever you want
                                  print('Countdown Started');
                                },

                                // This Callback will execute when the Countdown Ends.
                                onComplete: () {
                                  // Here, do whatever you want
                                  print('Countdown Ended');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),

                      ListView(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        //children: Provider.of<GamePlayProvider>(context, listen: true).question.answers.map((e) => _answerCard(answer: e, correct: false))

                        children: Provider.of<GamePlayProvider>(context, listen: true).question.answers.map(
                                (e) {
                                  // // get index
                                  // var index = amount.indexOf(e);
                                  //
                                  // print("Hello "+amount.indexOf(e).toString());
                                  print(e.id);
                                  return selectedIndex == e.id ? Padding(
                                    padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                                    child: Card(
                                        elevation: 10,
                                        // color: selectedIndex == index? Colors.green : null,
                                        shape:new RoundedRectangleBorder(
                                            side: new BorderSide(color:hasBeenSelected == true && selectedIndex == e.id && selectedIndex == Provider.of<GamePlayProvider>(context, listen: false).question.correctAnswer.answerId? Colors.green  : Colors.red, width: 2.0),
                                            borderRadius: BorderRadius.circular(4.0)),
                                        child:Center(
                                          child: ListTile(
                                            leading: Text(e.name),
                                            trailing: Icon(Icons.album_outlined,color: hasBeenSelected == true && selectedIndex == e.id && selectedIndex == Provider.of<GamePlayProvider>(context, listen: false).question.correctAnswer.answerId? Colors.green  : Colors.red,),
                                            onTap: () {
                                              setState(() {
                                                // selectedIndex = index;
                                              });
                                              // submit answer
                                              String accessToken = Provider.of<UserProvider>(context, listen: false).user.accessToken;
                                              int questionId = Provider.of<GamePlayProvider>(context, listen: false).question.id;
                                              int answerId = e.id;
                                              Provider.of<GamePlayProvider>(context, listen: false).answer(accessToken: accessToken, gameTypeId: 1, questionId: questionId, answerId: answerId);

                                            },
                                          ),
                                        )
                                    ),
                                  ):
                                  Padding(
                                    padding: const EdgeInsets.only(left: 38.0,right: 38.0),
                                    child: Card(
                                        elevation: 3,
                                        shape:new RoundedRectangleBorder(
                                            side: new BorderSide(color: hasBeenSelected == true && e.id == Provider.of<GamePlayProvider>(context, listen: false).question.correctAnswer.answerId? Colors.green  : Colors.grey, width: 2.0),
                                            borderRadius: BorderRadius.circular(4.0)),
                                        child:ListTile(
                                          leading: Text(e.name,style: TextStyle(color: hasBeenSelected == true && e.id == Provider.of<GamePlayProvider>(context, listen: false).question.correctAnswer.answerId? Colors.green  : Colors.grey,),),
                                          trailing: Icon(Icons.album_outlined,color: hasBeenSelected == true && e.id == Provider.of<GamePlayProvider>(context, listen: false).question.correctAnswer.answerId? Colors.green  : Colors.grey,),
                                          onTap: () async{

                                            if(hasBeenSelected == false){
                                              int currentChoose = e.id;
                                              shouldShowResult = true;
                                              resultIsTrue = e.id == Provider.of<GamePlayProvider>(context, listen: false).question.correctAnswer.id;
                                              int correctId = Provider.of<GamePlayProvider>(context, listen: false).question.correctAnswer.answerId;


                                              print("currentChoose is $currentChoose");
                                              print("shouldShowResult $shouldShowResult");
                                              print("resultIsTrue is $resultIsTrue");
                                              print("correctResult is $correctId");
                                              setState(() {

                                              });

                                              setState(() {

                                                hasBeenSelected = true;
                                                selectedIndex = e.id;
                                                print("selectedIndex is "+selectedIndex.toString()+ " correct answer id is "+Provider.of<GamePlayProvider>(context, listen: false).question.correctAnswer.answerId.toString());
                                              });


                                              // submit answer
                                              String accessToken = Provider.of<UserProvider>(context, listen: false).user.accessToken;
                                              int questionId = Provider.of<GamePlayProvider>(context, listen: false).question.id;
                                              int answerId = e.id;
                                              try{
                                                User user = await Provider.of<GamePlayProvider>(context, listen: false).answer(accessToken: accessToken, gameTypeId: 1, questionId: questionId, answerId: answerId);
                                                Provider.of<UserProvider>(context, listen: false).setUser(user);
                                              }
                                              catch(exp){
                                                print("submit answer exp");
                                                print(exp);
                                              }

                                              // show Button to go next
                                            }


                                          },
                                        )
                                    ),
                                  );
                                }
                                //     ListTile(
                                //   onTap: (){
                                //     // submit answer
                                //     String accessToken = Provider.of<UserProvider>(context, listen: false).user.accessToken;
                                //     int questionId = Provider.of<GamePlayProvider>(context, listen: false).question.id;
                                //     int answerId = e.id;
                                //     Provider.of<GamePlayProvider>(context, listen: false).answer(accessToken: accessToken, gameTypeId: 1, questionId: questionId, answerId: answerId);
                                //   },
                                //   title: Text(e.name),
                                // )
                        ).toList(),
                      ),
                      /*
                      ListView(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        children: amount.map((e) {
                          // get index
                          var index = amount.indexOf(e);
                          return selectedIndex == index? Padding(
                            padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                            child: Card(
                              elevation: 10,
                                // color: selectedIndex == index? Colors.green : null,
                              shape:new RoundedRectangleBorder(
                                  side: new BorderSide(color: Colors.green, width: 2.0),
                                  borderRadius: BorderRadius.circular(4.0)),
                              child:Center(
                                child: ListTile(
                                  leading: Text(e),
                                  trailing: Icon(Icons.album_outlined,color: selectedIndex == index? Colors.green : null,),
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                ),
                              )
                            ),
                          ):
                          Padding(
                            padding: const EdgeInsets.only(left: 38.0,right: 38.0),
                            child: Card(
                                elevation: 3,
                                child:ListTile(
                                  leading: Text(e),
                                  trailing: Icon(Icons.album_outlined),
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                )
                            ),
                          );
                        }).toList(),
                      ),

                       */
                      SizedBox(
                        height: 20,
                      ),
                      hasBeenSelected == false ? Container():Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 28.0,right: 45),
                            child: InkWell(
                                child: Text("Next",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                              onTap: (){
                                  // _controller.start();
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      )
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     SizedBox(
      //       width: 30,
      //     ),
      //     _button(title: "Start", onPressed: () => _controller.start()),
      //     SizedBox(
      //       width: 10,
      //     ),
      //     _button(title: "Pause", onPressed: () => _controller.pause()),
      //     SizedBox(
      //       width: 10,
      //     ),
      //     _button(title: "Resume", onPressed: () => _controller.resume()),
      //     SizedBox(
      //       width: 10,
      //     ),
      //     _button(
      //         title: "Restart",
      //         onPressed: () => _controller.restart(duration: _duration))
      //   ],
      // ),
     );
  }

  _button({required String title, required VoidCallback onPressed}) {
    return Expanded(
        child: ElevatedButton(
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: onPressed,
          // color: Colors.purple,
        ));}
}

