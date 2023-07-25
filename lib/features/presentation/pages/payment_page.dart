import 'package:base/features/presentation/components/page_title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  static String routeName = "/PaymentPage";
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: _mainWidget2(),
      ),
    );
  }
  Widget _mainWidget2(){
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageTitle(title: "Earning System", iconData: Icons.payments_rounded),
            /*
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.payment_rounded,size: 50.0,),
                  Text('Earning System',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),).tr(),
                ],
              ),
            ),

             */
            Padding(
              padding: EdgeInsets.only(left: 5.0,right: 5,top: 10),
              child: Container(
                child: Text("""Dear Investor...
         We are excited to inform you that our online investment platform is now open and ready for you to start investing your money. Our platform offers a variety of investment options, including stocks, bonds, mutual funds, and ETFs, all of which are designed to help you grow your wealth and achieve your financial goals.""",style: TextStyle(fontSize: 15,),textAlign: TextAlign.justify,),
              ),
            ),
            SizedBox(height: 5.0,),
            Padding(
              padding: EdgeInsets.only(left: 5.0,right: 5,top: 10),
              child: Container(
                child: Text("""         Our platform is user-friendly and easy to navigate, making it simple for you to open an investment account and start investing today. You can choose from a variety of investment options that are tailored to your investment goals and risk tolerance, and our team of experienced professionals is always available to provide guidance and answer any questions you may have.""",style: TextStyle(fontSize: 15,),textAlign: TextAlign.justify,),
              ),
            ),
            SizedBox(height: 5.0,),
            Padding(
              padding: EdgeInsets.only(left: 5.0,right: 5,top: 10),
              child: Container(
                child: Text("""         With our online investment platform, you can start investing with as little as a few dollars, and you can monitor your investments online from anywhere, at any time. We believe in transparency and strive to provide you with all the information you need to make informed investment decisions.""",style: TextStyle(fontSize: 15,),textAlign: TextAlign.justify,),
              ),
            ),
            SizedBox(height: 5.0,),
            Padding(
              padding: EdgeInsets.only(left: 5.0,right: 5,top: 10),
              child: Container(
                child: Text("""         We understand that investing can be a daunting process, especially for those who are new to the world of investing. That's why we are committed to providing our investors with the tools and resources they need to succeed. Our platform offers a wealth of educational materials, including articles, tutorials, and videos, to help you learn more about investing and make the most of your investment portfolio.""",style: TextStyle(fontSize: 15,),textAlign: TextAlign.justify,),
              ),
            ),
            SizedBox(height: 5.0,),
            Padding(
              padding: EdgeInsets.only(left: 5.0,right: 5,top: 10),
              child: Container(
                child: Text("""         We believe that everyone deserves access to quality investment opportunities, and we are committed to making investing simple and accessible for all. We look forward to helping you achieve your investment goals and grow your wealth with our online investment platform.""",style: TextStyle(fontSize: 15,),textAlign: TextAlign.justify,),
              ),
            ),
            SizedBox(height: 5.0,),
            Padding(
              padding: EdgeInsets.only(left: 5.0,right: 5,top: 10),
              child: Container(
                child:Text("Sincerely, \nFUMO Online Investment Team",style: TextStyle(fontSize: 15.0,),textAlign: TextAlign.left,)
              ),
            ),
            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/earn1.png')
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/earn2.png')
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: EdgeInsets.only(left: 5.0,right: 5,top: 10),
              child: Container(
                child: Text("""Deposit & Withdraw
For those who are going to start using it, I recommend using Trust wallet. Trust wallet is easy to use. The expert can use whatever he likes. The deposit address and the withdrawal address must be the same. Non-unique addresses will not be considered. If there are any errors, you can report it.""",style: TextStyle(fontSize: 15,),textAlign: TextAlign.justify,),
              ),
            ),
//             Padding(
//               padding: EdgeInsets.only(left: 0.0,right: 5,top: 10),
//               child: Container(
//                 child: Text("""Sincerely,
// FUMO Online Investment Team""",style: TextStyle(fontSize: 15,),textAlign: TextAlign.justify,),
//               ),
//             )
          ],
        ),
      ),
    );
  }
  Widget _mainWidget(){
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.payment_rounded,size: 50.0,),
                  Text('Earning System',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),).tr(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)
                  ),
                  color: Colors.grey[300],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("    DEPOSIT FOR LEVEL UPGRADE"),
                    Icon(Icons.arrow_circle_down_sharp,color: Colors.white,)
                  ],
                )
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(1,4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Card(
                    color: Colors.yellow,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    //set border radius more than 50% of height and width to make circle
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // const ListTile(
                        //   leading: Icon(Icons.album, size: 50),
                        //   title: Text('Heart Shaker'),
                        //   subtitle: Text('TWICE'),
                        // ),
                        SizedBox(height: 10,),
                        Text('Level-1',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white)),
                        SizedBox(height: 10,),
                        Text('+15%',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)),
                        SizedBox(height: 10,),
                        Text('(1 Month)',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      // topLeft: Radius.circular(10),
                      // topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(1,4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Card(
                    color: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      //set border radius more than 50% of height and width to make circle
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // const ListTile(
                        //   leading: Icon(Icons.album, size: 50),
                        //   title: Text('Heart Shaker'),
                        //   subtitle: Text('TWICE'),
                        // ),
                        SizedBox(height: 10,),
                        Text('Level-2',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white)),
                        SizedBox(height: 10,),
                        Text('+20%',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)),
                        SizedBox(height: 10,),
                        Text('(3 Months)',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      // topLeft: Radius.circular(10),
                      // topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(1, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Card(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      //set border radius more than 50% of height and width to make circle
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // const ListTile(
                        //   leading: Icon(Icons.album, size: 50),
                        //   title: Text('Heart Shaker'),
                        //   subtitle: Text('TWICE'),
                        // ),
                        SizedBox(height: 10,),
                        Text('Level-3',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white)),
                        SizedBox(height: 10,),
                        Text('+25%',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)),
                        SizedBox(height: 10,),
                        Text('(9 Months)',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 125,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(left: 15,right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Level-1',style: TextStyle(fontSize: 15,)),
                    SizedBox(height: 5.0,),
                    Text("""- If you will deposit \$10 , you get + 15% Bonus after 1 Month.""",style: TextStyle(fontSize: 12,)),
                    SizedBox(height: 5.0,),
                    Text('Level-2',style: TextStyle(fontSize: 15,)),
                    SizedBox(height: 5.0,),
                    Text("""- If you will deposit \$10 , you get + 20% Bonus after 3 Months.""",style: TextStyle(fontSize: 12,)),
                    SizedBox(height: 5.0,),
                    Text('Level-3',style: TextStyle(fontSize: 15,)),
                    SizedBox(height: 5.0,),
                    Text("""- If you will deposit \$10 , you get + 25% Bonus after 9 Months.""",style: TextStyle(fontSize: 12,)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15,right: 15,top: 5.0),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                    ),
                    color: Colors.grey[300],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("    REFER FOR MORE BONUS"),
                      Icon(Icons.arrow_circle_down_sharp,color: Colors.white,)
                    ],
                  ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/icons/Untitled-1-28.png')
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(left: 5.0,right: 5,top: 10),
              child: Container(
                child: Text("""Another 5% of all sales volumn in your 6 tiers is awarded to Regional Sales Leaders,Please contact Admin for details on how to become a Regional Sales Leader.Finally, new users who sign up with a firend's referral link before purchasing TET tokens now receive a 5% TET bonus on their purchases.(Note: this is a limited offer and expires soon)""",style: TextStyle(fontSize: 13),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
