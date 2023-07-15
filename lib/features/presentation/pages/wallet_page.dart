import 'package:base/features/domain/entities/deposit_address.dart';
import 'package:base/features/presentation/providers/dashboard_provider.dart';
import 'package:base/features/presentation/providers/user_provider.dart';
import 'package:base/features/presentation/providers/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/dashboard.dart';
import '../../domain/entities/user.dart';

class WalletPage extends StatefulWidget {
  static String routeName = "/WalletPage";
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(title: Text("FUMO",style: TextStyle(color: Colors.white),),),
      body: SafeArea(
        child: SingleChildScrollView(
            padding: EdgeInsets.all(8.0),
            child: _mainWidget(
              user: Provider.of<UserProvider>(context, listen: true).user,
              dashboard: Provider.of<DashboardProvider>(context, listen: true).dashboard,
              depositAddressList: Provider.of<WalletProvider>(context, listen: true).depositAddressList,
            )),
      ),
    );
  }

  Widget _mainWidget({required User user, required Dashboard dashboard, required List<DepositAddress> depositAddressList}){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.wallet_outlined,size: 30.0,),
                    Text('Wallet',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
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
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 35,),
                      Text(user.username,style: TextStyle(fontSize: 30,color: Colors.white)),
                      Text(user.email,style: TextStyle(fontSize: 15,color: Colors.white)),
                      SizedBox(height: 40,),
                      Text(user.level,style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold))
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
          SizedBox(height: 10.0,),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text("Refer Code"),
          //     SizedBox(width: 10,),
          //     Container(
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10),
          //           border: Border.all(
          //             color: Colors.black,
          //             width: 1,
          //           )
          //       ),
          //       child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Text("2D210WT",style: TextStyle(fontWeight: FontWeight.bold),),
          //       ),
          //     ),
          //     SizedBox(width: 10,),
          //     Icon(Icons.copy_sharp,color: Colors.grey,)
          //   ],
          // ),
          // SizedBox(height: 10.0,),
          Padding(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
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
                        Text("\$ ${dashboard.total_net_profit}",style: TextStyle(fontSize: 40,color: Colors.white),)
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Withdraw Amount",style: TextStyle(fontSize: 15,color: Colors.white),),
                        SizedBox(height: 10.0,),
                        Text("\$ ${dashboard.withdraw_balance}",style: TextStyle(fontSize: 40,color: Colors.white),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  debugPrint('ElevatedButton Clicked');
                  // Navigator.pushNamedAndRemoveUntil(context, PaymentPage.routeName, (route) => false);
                },
                icon: Icon(Icons.account_balance_wallet,color: Colors.amber,),  //icon data for elevated button
                label: Text("Deposit",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),), //label text
                // style: ElevatedButton.styleFrom(shape: StadiumBorder(),backgroundColor: Colors.white, foregroundColor: Colors.white, ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.white, ),

              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...depositAddressList.map((e) => _depositAddress(depositAddress: e)),
                /*

                Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text('Level-1 (\$10)'),
                          ),
                        ),
                        Container(
                          // width: MediaQuery.of(context).size.width * 0.95,
                          // height: MediaQuery.of(context).size.height * 0.25,
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage('assets/images/qrimage.png')
                            ),
                          ),
                        ),
                        Container(width:100,height:25,child: Text('bnb1hj8449vnm9cwdkaw60wuwlfck7mj2u',style: TextStyle(fontSize: 10),))
                      ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text('Level-1 (\$10)'),
                      ),
                    ),
                    Container(
                      // width: MediaQuery.of(context).size.width * 0.95,
                      // height: MediaQuery.of(context).size.height * 0.25,
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage('assets/images/qrimage.png')
                        ),
                      ),
                    ),
                    Container(width:100,height:25,child: Text('bnb1hj8449vnm9cwdkaw60wuwlfck7mj2u',style: TextStyle(fontSize: 10),))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text('Level-1 (\$10)'),
                      ),
                    ),
                    Container(
                      // width: MediaQuery.of(context).size.width * 0.95,
                      // height: MediaQuery.of(context).size.height * 0.25,
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage('assets/images/qrimage.png')
                        ),
                      ),
                    ),
                    Container(width:100,height:25,child: Text('bnb1hj8449vnm9cwdkaw60wuwlfck7mj2u',style: TextStyle(fontSize: 10),))
                  ],
                ),

                 */
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  debugPrint('ElevatedButton Clicked');
                  // Navigator.pushNamedAndRemoveUntil(context, PaymentPage.routeName, (route) => false);
                },
                icon: Icon(Icons.account_balance_wallet,color: Colors.amber,),  //icon data for elevated button
                label: Text("Withdraw",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),), //label text
                // style: ElevatedButton.styleFrom(shape: StadiumBorder(),backgroundColor: Colors.white, foregroundColor: Colors.white, ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.white, ),

              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  // height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                    boxShadow: [
                      BoxShadow(color: Colors.grey, spreadRadius: 3),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Wallet Address",style: TextStyle(fontSize: 13),textAlign: TextAlign.left,),
                      Text(user.wallet_address,style: TextStyle(fontSize: 12),textAlign: TextAlign.left,)
                    ],
                  ),
                ),
              ),
            ],
          )
          // Container(
          //   width: MediaQuery.of(context).size.width * 0.7,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     color: Colors.grey[400],
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text("Wallet Address",style: TextStyle(fontSize: 15)),
          //         Text("********************************",style: TextStyle(fontSize: 15)),
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(height:10.0),
          // Container(
          //   width: MediaQuery.of(context).size.width * 0.7,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     color: Colors.grey[400],
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text("Deposit Address",style: TextStyle(fontSize: 15)),
          //         Text("********************************",style: TextStyle(fontSize: 15)),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _depositAddress({required DepositAddress depositAddress}){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
                width: 1,
              )
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Center(child: Text(depositAddress.name)),
          ),
        ),
        Container(
          // width: MediaQuery.of(context).size.width * 0.95,
          // height: MediaQuery.of(context).size.height * 0.25,
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage('assets/images/qrimage.png')
            ),
          ),
        ),
        Container(width:100,height:25,child: Text(depositAddress.address,style: TextStyle(fontSize: 10),))
      ],
    );
  }
}
