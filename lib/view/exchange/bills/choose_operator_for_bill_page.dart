
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:myan_quiz/utils/global.dart';
import 'package:myan_quiz/view/exchange/bills/bills_page.dart';
import 'package:myan_quiz/view/exchange/gifts/exchage_page_gift.dart';

class ChooseOperatorBillPage extends StatefulWidget {
  const ChooseOperatorBillPage({Key? key}) : super(key: key);

  @override
  _ChooseOperatorBillPageState createState() => _ChooseOperatorBillPageState();
}

class _ChooseOperatorBillPageState extends State<ChooseOperatorBillPage> {


  // Future<AudioPlayer> playLocalAsset() async {
  //   AudioCache cache = new AudioCache();
  //   return await cache.play("assets/sound/Whistling Crackers Fireworks ! Sound Effect ! Notification.mp3");
  // }

  _phoneNoInputDialogBox(BuildContext context){


    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(15.0)),
        child: Container(
          height: 150,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("သင်ဖြည့်လိုသည့်ဖုန်းနံပါတ်အားဖြည့်သွင်းပါ။",style:TextStyle(),),
                Neumorphic(
                  margin: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
                  style: NeumorphicStyle(
                    depth: NeumorphicTheme.embossDepth(context),
                    boxShape: NeumorphicBoxShape.stadium(),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                  child: TextField(
                    //onChanged: this.widget.onChanged,
                    //controller: _controller,
                    decoration: InputDecoration.collapsed(hintText: "phone number"),
                  ),
                ),
                ElevatedButton(
                    onPressed: (){
                      // playLocalAsset();
                      Navigator.of(context).pop();
                      showDialog(context: context, builder: (BuildContext context) => CustomDialog());
                    },
                    child: Text("Close"),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Color(getColorHexFromStr('#FDD87D')),),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Color(getColorHexFromStr('#FDD87D')),)
                          )
                      )
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(getColorHexFromStr('#48CEAD')),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient:LinearGradient(
                      colors: [
                        Color(getColorHexFromStr('#FDD87D')),
                        Color(getColorHexFromStr('#FDD87D')),
                        Color(getColorHexFromStr('#BDE0B5')),
                        Color(getColorHexFromStr('#9CE5D3'))
                        //add more colors for gradient
                      ],
                      begin: Alignment.topLeft, //begin of the gradient color
                      end: Alignment.bottomRight, //end of the gradient color
                      stops: [0, 0.2, 0.5, 0.8] //stops for individual color
                    //set the stops number equal to numbers of color
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("profile > > >")
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("45289",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Coin Balances")
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Convert coins to :"),
                ElevatedButton(
                  onPressed: () {
                    _phoneNoInputDialogBox(context);

                  },
                  child: Text('bills'),
                  // style: ElevatedButton.styleFrom(shape: StadiumBorder(),
                  // shadowColor: Color(getColorHexFromStr('#FDD87D')),
                  // ),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Color(getColorHexFromStr('#FDD87D')),),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Color(getColorHexFromStr('#FDD87D')),)
                          )
                      )
                  ),

                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ExchangePageGift()));
                  },
                  child: Text('gifts'),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            //side: BorderSide(color: Color(getColorHexFromStr('#FDD87D')),)
                          )
                      )
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text("Choose your operator"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Card(
                color: Color(getColorHexFromStr('#9CE5D3')),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
               child: Padding(
                 padding: const EdgeInsets.all(18.0),
                 child: Container(
                     height: 100,
                     child: Image.asset("assets/images/mpt_logo.png")),
               ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BillsPage()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Card(
                color: Color(getColorHexFromStr('#9CE5D3')),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                      height: 100,
                      child: Image.asset("assets/images/atom_operator_logo.png")),
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BillsPage()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Card(
                color: Color(getColorHexFromStr('#9CE5D3')),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                      height: 100,
                      child: Image.asset("assets/images/mpt_logo.png")),
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BillsPage()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Card(
                color: Color(getColorHexFromStr('#9CE5D3')),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    height: 100,
                      child: Image.asset("assets/images/ooredoo_logo.png")),
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BillsPage()));
              },
            ),
          ),
        ],
      ),
    );
 
  }
}


class CustomDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0.0,right: 0.0),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 18.0,
            ),
            margin: EdgeInsets.only(top: 13.0,right: 8.0),
            decoration: BoxDecoration(
                color: Color(getColorHexFromStr('#FDD87D')),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      // child: new Text("Sorry please try \n again tomorrow", style:TextStyle(fontSize: 30.0,color: Colors.white)),
                      child: Image.asset("assets/images/Congratulations.png"),
                    )//
                ),
                SizedBox(height: 24.0),
                // InkWell(
                //   child: Container(
                //     padding: EdgeInsets.only(top: 15.0,bottom:15.0),
                //     decoration: BoxDecoration(
                //       color:Colors.white,
                //       borderRadius: BorderRadius.only(
                //           bottomLeft: Radius.circular(16.0),
                //           bottomRight: Radius.circular(16.0)),
                //     ),
                //     child:  Text(
                //       "OK",
                //       style: TextStyle(color: Colors.blue,fontSize: 25.0),
                //       textAlign: TextAlign.center,
                //     ),
                //   ),
                //   onTap:(){
                //     Navigator.pop(context);
                //   },
                // )

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Text("ဂုဏ်ယူပါတယ်။ \n သင့်လုပ်ဆောင်ချက်အောင်မြင်ပါတယ်။ \n ၂၄ နာရီအတွင်းဆောင်ရွက်ပေးသွားပါမယ်။ \n ဆက်ကြိုးစားဦးနော်", style:TextStyle(fontSize: 16.0,color: Colors.white),textAlign: TextAlign.center,),
                ),

              ],
            ),
          ),
          Positioned(
            right: 0.0,
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 14.0,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.close, color: Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
