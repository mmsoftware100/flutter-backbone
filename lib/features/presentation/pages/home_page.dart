
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/presentation/components/form_elements/our_drawer.dart';
import 'package:base/features/presentation/pages/friend_page.dart';
import 'package:base/features/presentation/pages/myteam_page.dart';
import 'package:base/features/presentation/pages/payment_page.dart';
import 'package:base/features/presentation/pages/wallet_page.dart';
import 'package:base/features/presentation/providers/crpyto_provider.dart';
import 'package:base/features/presentation/providers/dashboard_provider.dart';
import 'package:base/features/presentation/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/user.dart';
import 'calculator_page.dart';
import 'claim_point_page.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/HomePage";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  PersistentTabController _controller = PersistentTabController(initialIndex: 0);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _init();
  }




  void _init()async{
    print("_init");
    String accessToken = Provider.of<UserProvider>(context, listen: false).user.accessToken;
    String status = await Provider.of<CryptoProvider>(context, listen: false).selectCryptoPlz(accessToken: accessToken, page: 1, limit: 50, convert: "USD");
    print("status is $status");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FUMO"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications))
        ],
      ),
      body: _bottomNavigation(),
      drawer: OurDrawer(),
      floatingActionButton: _fab(),
    );
  }

  Widget _fab(){
    return FloatingActionButton(onPressed: _init, child: Icon(Icons.refresh),);
  }

  Widget _bottomNavigation(){
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.black12, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      // navBarStyle: NavBarStyle.style15, // Choose the nav bar style with this property.
      navBarStyle: NavBarStyle.style6,
    );
  }
  List<Widget> _buildScreens() {
    return [
      _mainWidget(),
      MyTeamPage(),
      //FriendPage(),
      //ClaimPointPage(),
      PaymentPage(),
      CalculatorPage(),
      WalletPage()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person_add),
        title: ("Referral"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),

      PersistentBottomNavBarItem(
        icon: Icon(Icons.currency_exchange,), //, color: Colors.white
        title: ("Earn"),
        //activeColorPrimary: CupertinoColors.activeGreen,
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.calculate),
        title: ("Calculator"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),

      PersistentBottomNavBarItem(
        icon: Icon(Icons.wallet),
        title: ("Wallet"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }




  Widget _mainWidget(){
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
              //_stackTest(),
              //_stackTestTwo(),
              _pageTitle(),
              _dashboardCard(),
              SizedBox(height: 8.0,),
              _verticalListRow(),
              _dashboardRow(),
              _dataTable(cryptoList: Provider.of<CryptoProvider>(context, listen: true).cryptoList),
          ],
        ),
      ),
    );
  }

  Widget _verticalListRow(){
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Column(
        children: [
          _buttonRow(),
          _teamMembers(),
        ],
      ),
    );
  }

  Widget _buttonRow(){
    return Row(
      children: [
        Text("Team 1/10"),
        Expanded(child: Container()),
        Text("Check")
      ],
    );
  }

  Widget _teamMembers(){
    return Container(
      height: 100,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(child: Icon(Icons.person)),
              ),
              Text("User $index")
            ],
          ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: 10
      ),
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
              child: _creditCard(user: Provider.of<UserProvider>(context, listen: true).user)
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

  Widget _creditCard({required User user}){
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
                  Text("${user.username} (${Provider.of<UserProvider>(context, listen: true).user.level})", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  SizedBox(height: 8.0,),
                  Text("${user.wallet_address}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  SizedBox(height: 8.0,),
                  Text("\$ ${user.referCode}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 36),)
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
        _revenueCard(title: "Revenue", amount: Provider.of<DashboardProvider>(context, listen: true).dashboard.deposit_amount),
        _revenueCard(title: "Earning", amount: Provider.of<DashboardProvider>(context, listen: true).dashboard.deposit_profit_balance),
        _revenueCard(title: "Total Amount", amount: Provider.of<DashboardProvider>(context, listen: true).dashboard.total_net_profit),
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
  Widget _dataTable({required List<Crypto> cryptoList}){
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
          ...List.generate(cryptoList.length, (index) => _dataTableRow(crypto: cryptoList[index], index: index))
          /*

          _dataTableRow(),
          _dataTableRow(),
          _dataTableRow(),
          _dataTableRow(),
          _dataTableRow(),
          _dataTableRow(),

           */
        ],
      ),
    );
  }

  TableRow _dataTableRow({required Crypto crypto, required int index}){
    return TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(index.toString()),
            ),
            Row(
              children: [
                Icon(Icons.currency_bitcoin),
                Text(crypto.name),
                SizedBox(width: 8.0,),
                Text(crypto.symbol, style: TextStyle(color: Colors.grey),),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text("\$"+ crypto.price.toString()),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text("\$"+ crypto.marketCap.toString()),
            ),
          ]
      );
  }
}
