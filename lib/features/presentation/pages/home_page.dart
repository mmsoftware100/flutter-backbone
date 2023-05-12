
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/HomePage";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications))
        ],
      ),
      body: _mainWidget(),
    );
  }

  Widget _mainWidget(){
    return Column(
      children: [
          //_stackTest(),
          //_stackTestTwo(),
          _pageTitle(),
          _dashboardCard(),
          SizedBox(height: 8.0,),
          _dashboardRow(),
          _dataTable(),
      ],
    );
  }

  Widget _pageTitle(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Icons.home),
          SizedBox(width: 8.0,),
          Text("Home")
        ],
      ),
    );
  }

  Widget _stackTest(){
    return Stack(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 90,
            height: 90,
            color: Colors.green,
          ),
        ),
        Container(
          width: 80,
          height: 80,
          color: Colors.blue,
        ),
      ],
    );
  }

  Widget _stackTestTwo(){
    return Container(
        padding: EdgeInsets.all(10),
        child:
        Stack(
            children: [

              //align at bottom center using Align()
              Align(
                  alignment: Alignment.bottomCenter,
                  child:Container(
                    height:100,
                    width:100,
                    color: Colors.greenAccent,
                    child: Text("Box I"),
                  )
              ),

              //align to top center using Container();
              Container(
                  alignment: Alignment.topCenter,
                  child:Container(
                    height:100,
                    width:100,
                    color: Colors.redAccent,
                    child: Text("Box II"),
                  )
              ),

              //Alignment at Center
              Container(
                  alignment: Alignment.center,
                  child:Container(
                    height:100,
                    width:100,
                    color: Colors.blueAccent,
                    child: Text("Box III"),
                  )
              ),

              //alignment at veritically center, and at left horizontally
              Align(
                  alignment: Alignment.centerLeft,
                  child:Container(
                    height:100,
                    width:100,
                    color: Colors.orangeAccent,
                    child: Text("Box IV"),
                  )
              ),

              //alignment at veritically center, and at right horizontally
              Align(
                  alignment: Alignment.centerRight,
                  child:Container(
                    height:100,
                    width:100,
                    color: Colors.greenAccent,
                    child: Text("Box V"),
                  )
              ),

              //manual position with left, top, right, bottom
              Positioned(
                  left:0,
                  top:0,
                  //you can use "right" and "bottom" too
                  child:Container(
                    height:100,
                    width:100,
                    color: Colors.purple,
                    child: Text("Box VI"),
                  )
              ),
            ]
        )
    );
  }
  Widget _dashboardCard(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.90,
            height: MediaQuery.of(context).size.height * 0.2,
            color: Colors.transparent,
          ),
          Positioned(
              //right: 0,
              //bottom: 0,
              child: _creditCard()
          ),
          Positioned(
              left: 0,
              top: 0,
              child: _timeCircleCard()),
        ],
      ),
    );
  }

  Widget _timeCircleCard(){
    return Container(
      padding: EdgeInsets.all(36.0),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        shape: BoxShape.circle,
          boxShadow: [
          BoxShadow(blurRadius: 3.0, spreadRadius: 1.0, color: Colors.black12, offset: Offset(0,0))
        ]
      ),
      child: Text("21:05:25", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),),
    );
  }

  Widget _creditCard(){
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(blurRadius: 3.0, spreadRadius: 1.0, color: Colors.black12, offset: Offset(3,3))
          ]
      ),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.transparent,
                child: Text(""),
              )),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(8.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 24.0,),
                  Text("Zayar05 (Level-1)", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  SizedBox(height: 8.0,),
                  Text("**** **** **** 0104", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  SizedBox(height: 8.0,),
                  Text("\$ 10.2", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 36),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _dashboardRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _revenueCard(title: "Revenue", amount: 10.0),
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
  Widget _dataTable(){
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Table(
        columnWidths: {
          0: FractionColumnWidth(0.05),
          1: FractionColumnWidth(0.5),
        },
        children: [
          TableRow(
              children: [
                Text("#", style: TextStyle(fontWeight: FontWeight.bold),),
                Text(""),
                Text("Price", style: TextStyle(fontWeight: FontWeight.bold),),
                Text("Market Cap", style: TextStyle(fontWeight: FontWeight.bold),)
              ]
          ),
          _dataTableRow(),
          _dataTableRow(),
          _dataTableRow(),
          _dataTableRow(),
          _dataTableRow(),
          _dataTableRow(),
        ],
      ),
    );
  }

  TableRow _dataTableRow(){
    return TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text("1"),
            ),
            Row(
              children: [
                Icon(Icons.currency_bitcoin),
                Text("Bitcoin Core"),
                SizedBox(width: 8.0,),
                Text("BTC", style: TextStyle(color: Colors.grey),),
              ],
            ),
            Text("\$8.328.54"),
            Text("\$8.328.54"),
          ]
      );
  }
}
