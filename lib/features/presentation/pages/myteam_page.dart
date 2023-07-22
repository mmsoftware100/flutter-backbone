import 'package:base/features/domain/entities/referral.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/referral_provider.dart';

class MyTeamPage extends StatefulWidget {
  static String routeName = "/MyTeam";
  const MyTeamPage({Key? key}) : super(key: key);

  @override
  State<MyTeamPage> createState() => _MyTeamState();
}

class _MyTeamState extends State<MyTeamPage> {

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: _mainWidget(referralList: Provider.of<ReferralProvider>(context, listen: true).referralList)),
    );
  }

  Widget _mainWidget({required List<Referral> referralList}){
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.green,
                      boxShadow: [
                        BoxShadow(spreadRadius: 1, blurRadius: 1.0, offset: Offset(0,3), color: Colors.grey)
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0), // 1. ညာဘက် တိုးလိုက်ပါပြီ။
                    child: Text("MyTeam",style: TextStyle(fontSize: 20,color: Colors.white),).tr(),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Text("Team acceleration",style: TextStyle(fontSize: 23,color: Colors.amber,),textAlign: TextAlign.left,).tr(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/icons/Untitled-1-29.jpg')
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            /*
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print(isSwitched);
                        });
                      },
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.green,
                    ),
                    Text("Active friends: 0/10",style: TextStyle(fontSize: 13,color: Colors.green,),textAlign: TextAlign.left,)
                  ],
                ),
                Text("Friend Details",style: TextStyle(fontSize: 20,color: Colors.amber,))
              ],
            ),

             */
            if(referralList.isEmpty) Text("No Referral Data"),
            Container(
              height: 300,
              color: Colors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    DataTable(
                        headingRowHeight: 0,
                        columns: [
                          // 3. title ထည့်ပြီးဖြစ်
                          DataColumn(label: Text('#') ),
                          DataColumn(label: Text('Name') ),
                          DataColumn(label: Text('Email') ),
                          DataColumn(label: Text('Deposit') ),
                          DataColumn(label: Text('%') ),
                          DataColumn(label: Text('Revenue') )
                        ],
                        rows: [
                          ...referralList.map((e) => _getReferralRow(referral: e)),
                          // DataRow( cells: [ DataCell(Container(width:20,child: Icon(Icons.account_circle,color: Colors.green,)),),DataCell(Text('Myowin99',style: TextStyle(color: Colors.green),)),DataCell(Text('Level-1',style: TextStyle(color: Colors.green),)),DataCell(Text('myowin98@gmail.com',style: TextStyle(color: Colors.green),)),DataCell(Text('+5%',style: TextStyle(color: Colors.green),)),DataCell(Text('\$ xxx',style: TextStyle(color: Colors.green),))]),
                          // DataRow( cells: [ DataCell(Container(width:20,child: Icon(Icons.account_circle,color: Colors.green,))),DataCell(Text('Myowin99',style: TextStyle(color: Colors.green),)),DataCell(Text('Level-1',style: TextStyle(color: Colors.green),)),DataCell(Text('myowin98@gmail.com',style: TextStyle(color: Colors.green),)),DataCell(Text('+5%',style: TextStyle(color: Colors.green),)),DataCell(Text('\$ xxx',style: TextStyle(color: Colors.green),))]),
                          // DataRow( cells: [ DataCell(Container(width:20,child: Icon(Icons.account_circle,color: Colors.green,))),DataCell(Text('Myowin99',style: TextStyle(color: Colors.green),)),DataCell(Text('Level-1',style: TextStyle(color: Colors.green),)),DataCell(Text('myowin98@gmail.com',style: TextStyle(color: Colors.green),)),DataCell(Text('+5%',style: TextStyle(color: Colors.green),)),DataCell(Text('\$ xxx',style: TextStyle(color: Colors.green),))]),
                          // DataRow( cells: [ DataCell(Icon(Icons.account_circle,color: Colors.green,)),DataCell(Text('Myowin99',style: TextStyle(color: Colors.green),)),DataCell(Text('Level-1',style: TextStyle(color: Colors.green),)),DataCell(Text('myowin98@gmail.com',style: TextStyle(color: Colors.green),)),DataCell(Text('+5%',style: TextStyle(color: Colors.green),)),DataCell(Text('\$ xxx',style: TextStyle(color: Colors.green),))]),
                          // DataRow( cells: [ DataCell(Icon(Icons.account_circle,color: Colors.green,)),DataCell(Text('Myowin99',style: TextStyle(color: Colors.green),)),DataCell(Text('Level-1',style: TextStyle(color: Colors.green),)),DataCell(Text('myowin98@gmail.com',style: TextStyle(color: Colors.green),)),DataCell(Text('+5%',style: TextStyle(color: Colors.green),)),DataCell(Text('\$ xxx',style: TextStyle(color: Colors.green),))]),
                          // DataRow( cells: [ DataCell(Icon(Icons.account_circle,color: Colors.green,)),DataCell(Text('Myowin99',style: TextStyle(color: Colors.green),)),DataCell(Text('Level-1',style: TextStyle(color: Colors.green),)),DataCell(Text('myowin98@gmail.com',style: TextStyle(color: Colors.green),)),DataCell(Text('+5%',style: TextStyle(color: Colors.green),)),DataCell(Text('\$ xxx',style: TextStyle(color: Colors.green),))]),

                        ]
                    )
                  ],
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    debugPrint('ElevatedButton Clicked');
                    // Navigator.pushNamedAndRemoveUntil(context, PaymentPage.routeName, (route) => false);
                  },
                  icon: Icon(Icons.add,color: Colors.amber,),  //icon data for elevated button
                  label: Text("Invite Friends",style: TextStyle(color: Colors.amber),), //label text
                  // style: ElevatedButton.styleFrom(shape: StadiumBorder(),backgroundColor: Colors.white, foregroundColor: Colors.white, ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.white, ),

                ),
            ),
          ],
        ),
      ),
    );
  }

  DataRow _getReferralRow({required Referral referral}){
    return DataRow(
        cells: [
          DataCell(Container(width:10,child: Icon(Icons.account_circle,color: Colors.green,)),),
          DataCell(Text(referral.name,style: TextStyle(color: Colors.green),)),
          DataCell(Text(referral.email,style: TextStyle(color: Colors.green),)),
          DataCell(Text(referral.deposit.toString(),style: TextStyle(color: Colors.green),)),
          DataCell(Text(referral.percentage.toString(),style: TextStyle(color: Colors.green),)),
          DataCell(Text('\$ ${referral.revenue}',style: TextStyle(color: Colors.green),))
        ])
    ;
  }
}
