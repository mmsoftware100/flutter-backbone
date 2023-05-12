import 'package:flutter/material.dart';

class BalancePage extends StatefulWidget {
  static String routeName = "/BalancePage";
  const BalancePage({Key? key}) : super(key: key);

  @override
  State<BalancePage> createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FUMO"),
      ),
      body:  _mainWidget(),
    );
  }

  Widget _mainWidget(){
    return Column(
      children: [
        _balanceInfo(),
        _dashboardRow(),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text("\$ 2.55" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
            )),
        Expanded(child: _transactionList())
      ],
    );
  }


  Widget _balanceInfo(){
    return Row(
      children: [
        Expanded(child: Container()),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 36,),
            Text("Your Balance", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),),
            SizedBox(height: 8.0,),
            Text("\$ 12.75", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.green),),
            SizedBox(height: 24,),
          ],
        ),
        Expanded(child: Container()),
      ],
    );
  }
  Widget _dashboardRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _revenueCard(title: "Deposit", amount: 10.0),
        _revenueCard(title: "Earning", amount: 0.2),
        _revenueCard(title: "Total Amount", amount: 10.2),
      ],
    );
  }

  Widget _revenueCard({required String title, required double amount}){
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(spreadRadius: 1, blurRadius: 1.0, offset: Offset(0,3), color: Colors.grey)
          ]
      ),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),),
          SizedBox(height: 8.0,),
          Container(color: Colors.orange, width: 50, height: 2,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("\$ $amount" , style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),),
          )
        ],
      ),
    );
  }

  Widget _transactionList(){
    /*
    return Column(
      children: List.generate(10, (index) => _transactionCard())
    );

     */
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => _transactionCard(),
        separatorBuilder: (context, index) => Divider(),
        itemCount: 20
    );
  }

  Widget _transactionCard(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 8.0, 8.0, 8.0),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text("Myowin99 (Level-1)", style: TextStyle(fontStyle: FontStyle.italic, color: Colors.green),)
          ),
          Expanded(
              flex: 1,
              child: Text("+5%" , style: TextStyle(fontStyle: FontStyle.italic, color: Colors.orange),)),
          Expanded(
              flex: 1,
              child: Text("\$ ---", style: TextStyle(fontStyle: FontStyle.italic, color: Colors.orange),))
        ],
      ),
    );
  }
}
