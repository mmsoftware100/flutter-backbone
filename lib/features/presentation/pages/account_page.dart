import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  static String routeName = "/AccountPage";
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("FUMO",style: TextStyle(color: Colors.white),),),
      body: SafeArea(
        child: _mainWidget(),
      ),
    );
  }

  Widget _mainWidget(){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.account_circle_rounded,size: 30.0,),
                    Text('Account',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.logout_sharp,size: 30.0,color: Colors.red,),
                    Text('Logout',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.red),),
                  ],
                ),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 48),
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 35,),
                      Text("Zayar07",style: TextStyle(fontSize: 30,color: Colors.white)),
                      Text("zayarmin115@gmai.com",style: TextStyle(fontSize: 15,color: Colors.white)),
                      SizedBox(height: 40,),
                      Text("Level-1",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 40.0,
                child: Icon(
                  Icons.account_circle,size: 80,color: Colors.grey,
                ),
              ),
              Positioned(
                  bottom: -50.0,
                  left: -25.0,
                  child: Image(image: AssetImage('assets/icons/Untitled-1-08.png'),width: 200,height: 200,))
            ],
          ),
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Refer Code"),
              SizedBox(width: 10,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )
                ),
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text("2D210WT",style: TextStyle(fontWeight: FontWeight.bold),),
                 ),
              ),
              SizedBox(width: 10,),
              Icon(Icons.copy_sharp,color: Colors.grey,)
            ],
          ),
          SizedBox(height: 10.0,),
          Padding(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green,
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Total Amount",style: TextStyle(fontSize: 15,color: Colors.white),),
                        SizedBox(height: 10.0,),
                        Text("\$ 10.2",style: TextStyle(fontSize: 40,color: Colors.white),)
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 130,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4,
                                offset: Offset(4, 8), // Shadow position
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.account_balance_wallet_rounded,color: Colors.amber,size: 40,),
                              Text("Deposit",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                        SizedBox(height: 18,),
                        Container(
                          width: 130,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4,
                                offset: Offset(4, 8), // Shadow position
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.account_balance_wallet_rounded,color: Colors.amber,size: 40,),
                              Text("Withdraw",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),)
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              color: Colors.grey[400],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Wallet Address",style: TextStyle(fontSize: 15)),
                  Text("********************************",style: TextStyle(fontSize: 15)),
                ],
              ),
            ),
          ),
          SizedBox(height:10.0),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[400],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Deposit Address",style: TextStyle(fontSize: 15)),
                  Text("********************************",style: TextStyle(fontSize: 15)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
