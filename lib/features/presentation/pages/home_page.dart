

import 'package:base/core/util/loading_dialog.dart';
import 'package:base/features/data/const/data.dart';
import 'package:base/features/domain/entities/crypto.dart';
import 'package:base/features/presentation/components/form_elements/our_drawer.dart';
import 'package:base/features/presentation/components/page_title.dart';
import 'package:base/features/presentation/pages/friend_page.dart';
import 'package:base/features/presentation/pages/myteam_page.dart';
import 'package:base/features/presentation/pages/payment_page.dart';
import 'package:base/features/presentation/pages/setting_page.dart';
import 'package:base/features/presentation/pages/test_page.dart';
import 'package:base/features/presentation/pages/user_login_test_page.dart';
import 'package:base/features/presentation/pages/wallet_page.dart';
import 'package:base/features/presentation/providers/crpyto_provider.dart';
import 'package:base/features/presentation/providers/dashboard_provider.dart';
import 'package:base/features/presentation/providers/language_provider.dart';
import 'package:base/features/presentation/providers/referral_provider.dart';
import 'package:base/features/presentation/providers/user_provider.dart';
import 'package:base/features/presentation/providers/wallet_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/app_language.dart';
import '../../domain/entities/dashboard.dart';
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
  int currentIndex = 0;
  int drawerChoice = 0;
  int retWidget = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> _listViewData = [
    "Home",
    "Referral",
    "Earn",
    "Calculator",
    "Wallet"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();

  }

 _onDrawerChange(int i){
    Navigator.of(context).pop();
    print(i);
    setState(() {
       currentIndex = i;
    });
    _checkDrawer();
 }
 _checkDrawer(){
    if(currentIndex == 0){
      setState(() {
        retWidget = 0;
      });
    }
 }


  void _init()async{
    print("_init");
    // Navigator.pushNamed(context, TestPage.routeName);
   String accessToken = Provider.of<UserProvider>(context, listen: false).user.accessToken;
   Provider.of<CryptoProvider>(context, listen: false).selectCryptoPlz(accessToken: accessToken, page: 1, limit: 50, convert: "USD");
    Provider.of<DashboardProvider>(context, listen: false).getDashboardPlz(accessToken: accessToken);
    Provider.of<ReferralProvider>(context, listen: false).getReferralListPlz(accessToken: accessToken);
    Provider.of<WalletProvider>(context, listen: false).getDepositAddressListPlz(accessToken: accessToken);
    Provider.of<WalletProvider>(context, listen: false).getWithdrawTransactionListPlz(accessToken: accessToken);
    Provider.of<WalletProvider>(context, listen: false).getDepositTransactionListPlz(accessToken: accessToken);

   // print("status is $status");
    // login

    // register

    // update

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FUMO"),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, SettingPage.routeName);
          }, icon: Icon(Icons.settings)),
          IconButton(onPressed: ()async{
            LoadingDialog.show(context);
            await Provider.of<UserProvider>(context, listen: false).logout();
            LoadingDialog.hide(context);
            Navigator.pushNamed(context, UserLoginPage.routeName);
          }, icon: Icon(Icons.logout)),
          //_languageDropdown()
          // language drop down in action
        ],
      ),
      body: currentIndex == 0 ?  _mainWidget() : currentIndex == 1 ? MyTeamPage() : currentIndex == 2 ? PaymentPage() : currentIndex == 3 ? CalculatorPage() : currentIndex == 4 ? WalletPage() : Container() ,
      //bottomNavigationBar: _bottomNavigation(),
      drawer: Drawer(

        child: Column(
          children: [
            Image.asset("assets/logo/logo-trans.png"),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount: _listViewData.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: currentIndex == index ? Colors.grey : Colors.white,
                    child: ListTile(
                      leading: index == 0 ? Icon(Icons.home) : index == 1 ? Icon(Icons.person_add): index == 2 ? Icon(Icons.currency_exchange):index == 3 ? Icon(Icons.calculate): index == 4 ? Icon(Icons.wallet) : Icon(Icons.settings),
                      title: Text(_listViewData[index]).tr(),
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                          print('Current Index is '+currentIndex.toString());
                          _onDrawerChange(currentIndex);
                        });

                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white10,
        type: BottomNavigationBarType.shifting,
        selectedFontSize: 20,
        selectedIconTheme: IconThemeData(color: Colors.blueAccent),
        selectedItemColor: Colors.blueAccent,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(color: Colors.black),
        unselectedItemColor: Colors.black,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ('Home').tr(),
            backgroundColor: Colors.white10,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: ("Referral").tr(),
            backgroundColor: Colors.white10,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_exchange,), //, color: Colors.white
            label: ("Earn").tr(),
            backgroundColor: Colors.white10,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: ("Calculator").tr(),
            backgroundColor: Colors.white10,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: ("Wallet").tr(),
            backgroundColor: Colors.white10,
          ), //New

        ],
        currentIndex: currentIndex,
        onTap: _onItemTapped,
      )

      // drawer: Drawer(
      //   child: Container(
      //     child: ListView.builder(
      //       padding: EdgeInsets.all(10.0),
      //       itemCount: _listViewData.length,
      //       itemBuilder: (context, index) {
      //         return Container(
      //           color: _currentSelected == index ? Colors.deepPurple : Colors.white,
      //           child: ListTile(
      //             leading: _currentSelected == 0 ? Icon(Icons.home) : _currentSelected == 1 ? Icon(Icons.payment): _currentSelected == 2 ? Icon(Icons.account_circle):_currentSelected == 3 ? Icon(Icons.help):Icon(Icons.settings),
      //             title: Text(_listViewData[index]).tr(),
      //             onTap: () {
      //               setState(() {
      //                 _currentSelected = index;
      //               });
      //               if(_currentSelected == 0){
      //                 _onDrawerChange(homesubmenu);
      //                 _controller = PersistentTabController(initialIndex: 0);
      //               }
      //               else if(_currentSelected == 1){
      //                 _onDrawerChange(referralsubmenu);
      //                 _controller = PersistentTabController(initialIndex: 1);
      //               }
      //               else if(_currentSelected == 2){
      //                 _onDrawerChange(earnsubmenu);
      //                 _controller = PersistentTabController(initialIndex: 2);
      //               }
      //               else if(_currentSelected == 3){
      //                 _onDrawerChange(calculatorsubmenu);
      //                 _controller = PersistentTabController(initialIndex: 3);
      //               }
      //               else if(_currentSelected == 4){
      //                 _onDrawerChange(walletsubmenu);
      //                 _controller = PersistentTabController(initialIndex: 4);
      //               }
      //               else if(_currentSelected == 5){
      //                 _onDrawerChange(settingsubmenu);
      //               }
      //             },
      //           ),
      //         );
      //       },
      //     ),
      //   ),
      // ),
      // floatingActionButton: _fab(),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      print('Current index is' + index.toString());
      currentIndex = index;
    });
    _init();
    if(index != menudrawer){
      if(index == 0){

      }
    }
  }

  Widget _fab(){
    return FloatingActionButton(onPressed: _init, child: Icon(Icons.refresh),);
  }

  Widget _bottomNavigation(){
    return PersistentTabView(
      context,
      controller:  _controller,
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
      onItemSelected: (index){
        setState(() {
          _controller.index = index;
        });
      },

       // selectedIndex: _controller.index,
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
        title: ("Home").tr(),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person_add),
        title: ("Referral").tr(),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),

      PersistentBottomNavBarItem(
        icon: Icon(Icons.currency_exchange,), //, color: Colors.white
        title: ("Earn").tr(),
        //activeColorPrimary: CupertinoColors.activeGreen,
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.calculate),
        title: ("Calculator").tr(),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),

      PersistentBottomNavBarItem(
        icon: Icon(Icons.wallet),
        title: ("Wallet").tr(),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }




  Widget _mainWidget(){
    return Container(
      child: Column(
        children: [
            //_stackTest(),
            //_stackTestTwo(),
            _pageTitle(),
            _dashboardCard(user: Provider.of<UserProvider>(context, listen: true).user,dashboard: Provider.of<DashboardProvider>(context, listen: true).dashboard),
            SizedBox(height: 8.0,),
            // _verticalListRow(),
            _dashboardRow(dashboard: Provider.of<DashboardProvider>(context, listen: true).dashboard),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _dataTable(cryptoList: Provider.of<CryptoProvider>(context, listen: true).cryptoList),
                ],
              ),
            ),
          )
        ],
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
    return PageTitle(title: "Home", iconData: Icons.home);
    return Padding(
      padding: const EdgeInsets.only(left: 15.0,right: 15.0),
      child: Container(
        padding: EdgeInsets.all(24.0),
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.red,
              blurRadius: 10.0, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
              offset: Offset(
                0.0, // Move to right 10  horizontally
                0.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.home,size: 30.0, color: Colors.white,),
            SizedBox(width: 24.0,),
            Text('Home',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white),).tr(),
          ],
        ),
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Icons.home),
          SizedBox(width: 8.0,),
          Text(("Home").tr())
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
  Widget _dashboardCard({required User user,required Dashboard dashboard}){
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
              child: _creditCard(user: user,dashboard: dashboard)
          ),
          Positioned(
              left: 5,
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
          image: DecorationImage(
            image: AssetImage("assets/images/user.png"),
            fit: BoxFit.fill,
          ),
        color: Colors.orangeAccent,
        shape: BoxShape.circle,
          boxShadow: [
          BoxShadow(blurRadius: 3.0, spreadRadius: 3.0, color: Colors.black12, offset: Offset(0,0))
        ]
      ),
      child: null
      // child: Image.asset('assets/images/user.png',width: 40,
      //     height: 40,
      //     fit:BoxFit.fill )
      //child: Text("21:05:25", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),),
    );
  }

  Widget _creditCard({required User user,required Dashboard dashboard}){
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
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
                  Text("${user.username} (${user.level})", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  SizedBox(height: 8.0,),
                  Text("${user.wallet_address}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  SizedBox(height: 8.0,),
                  Text("\$ ${dashboard.total_net_profit}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 36),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _dashboardRow({required Dashboard dashboard}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _revenueCard(title:  ("Deposit rate").tr() , amount: dashboard.deposit_profit_balance),
        _revenueCard(title: ("Team rate").tr() , amount: dashboard.referral_balance),
        _revenueCard(title: ("Total Amount").tr() , amount: dashboard.total_net_profit),
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
          Text(title.tr(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),),
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
          0: FractionColumnWidth(0.1),
          1: FractionColumnWidth(0.5),
          2: FractionColumnWidth(0.2),
          3: FractionColumnWidth(0.2),
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
              child: Text((index + 1).toString()),
            ),
            Row(
              children: [
                Icon(Icons.currency_bitcoin),
                Text(crypto.name,style: TextStyle(fontSize: 11.0,fontWeight: FontWeight.bold),),
                SizedBox(width: 8.0,),
                Text(crypto.symbol, style: TextStyle(color: Colors.grey),),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text("\$"+ crypto.price.toStringAsFixed(3)),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text("\$"+ crypto.marketCap.toStringAsFixed(3)),
            ),
          ]
      );
  }
}
