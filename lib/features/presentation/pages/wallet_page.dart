import 'package:base/core/util/loading_dialog.dart';
import 'package:base/features/domain/entities/deposit_address.dart';
import 'package:base/features/presentation/pages/user_login_test_page.dart';
import 'package:base/features/presentation/providers/dashboard_provider.dart';
import 'package:base/features/presentation/providers/user_provider.dart';
import 'package:base/features/presentation/providers/wallet_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  String valueText = "";
  TextEditingController _textFieldController = new TextEditingController();
  bool checktext = false;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  void _init()async{
    print("_init");
    // Navigator.pushNamed(context, TestPage.routeName);
    String accessToken = Provider.of<UserProvider>(context, listen: false).user.accessToken;

  }

  Future<void> _displayTextInputDialog(BuildContext context,DepositAddress depositAddress) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Deposit Form'),
            content: Container(
              width: double.infinity,
              height: 100,
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        valueText = value;
                      });
                      if(value != ""){
                        if(int.parse(value) < 10){
                          setState(() {
                            checktext = true;
                          });
                        }
                        else{
                          setState(() {
                            checktext = false;
                          });
                        }
                      }
                    },
                    controller: _textFieldController,
                    decoration: InputDecoration(hintText: "Deposit Amount"),
                  ),
                  checktext == true ? Text("Amount must contain more than 10\$",style: TextStyle(color: Colors.red),) : Text("")
                ],
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('Deposit'),
                onPressed: () {
                  setState(() {
                    //codeDialog = valueText;
                    Navigator.pop(context);
                  });
                },
              ),
              MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('Close'),
                onPressed: () {
                  setState(() {
                    //codeDialog = valueText;
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  String validatePassword(String value) {
    if(value != ""){
      if (!(int.parse(value) < 10 ) && value.isNotEmpty) {
        return "Deposit Amount  should contain more than 10\$";
      }
      return value;
    }
    else
      return value;
  }


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
                    Text('Wallet',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),).tr(),
                  ],
                ),
                InkWell(
                  onTap: ()async{
                    LoadingDialog.show(context);
                    await Provider.of<UserProvider>(context, listen: false).logout;
                    // hide loading screen
                    LoadingDialog.hide(context);
                    Navigator.pushNamed(context, UserLoginPage.routeName);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.logout_sharp,size: 30.0,color: Colors.red,),
                      Text('Logout',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.red),).tr(),
                    ],
                  ),
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
                        Text("Total Amount",style: TextStyle(fontSize: 15,color: Colors.white),).tr(),
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
                        Text("Withdraw Amount",style: TextStyle(fontSize: 15,color: Colors.white),).tr(),
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
                label: Text("Deposit",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),).tr(), //label text
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
                label: Text("Withdraw",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),).tr(), //label text
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
                child: InkWell(
                  onLongPress: (){
                    Clipboard.setData(ClipboardData(text: user.wallet_address));
                    Fluttertoast.showToast(
                        msg: "Withdraw Address Copied Successfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  },
                  onTap: ()async{
                    setState(() {
                      _textFieldController.text = "";
                    });
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Stack(
                              children: <Widget>[
                                Positioned(
                                  right: -40.0,
                                  top: -40.0,
                                  child: InkResponse(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      child: Icon(Icons.close),
                                      backgroundColor: Colors.red,
                                    ),
                                  ),
                                ),
                                Form(
                                  key: _formkey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          controller: _textFieldController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              labelText: 'Enter Withdraw Amount',
                                              icon: Icon(Icons.monetization_on)
                                          ),
                                          validator: (value){
                                            if(value != ""){
                                              if(int.parse(value.toString()) < 10){
                                                return "Amount must morethan 10\$";
                                              }
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MaterialButton(
                                          color: Colors.green,
                                          child: Text("Withdraw",style: TextStyle(color: Colors.white),),
                                          onPressed: ()async {
                                            if (_formkey.currentState!.validate()) {
                                              _formkey.currentState!.save();
                                              print('State is valid');
                                              String accessToken = Provider.of<UserProvider>(context, listen: false).user.accessToken;
                                              _WithdrawTransaction(accessToken,user.wallet_address,_textFieldController.text);
                                              Navigator.of(context).pop();
                                            }
                                            else{
                                              print('State is no valid');
                                            }
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
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
        InkWell(
          onLongPress: (){
            Clipboard.setData(ClipboardData(text: depositAddress.address));
            Fluttertoast.showToast(
                msg: "Deposit Address Copied Successfully",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0
            );
          },
          onTap: ()async{
            setState(() {
              _textFieldController.text = "";
            });
            //_displayTextInputDialog(context,depositAddress);
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Stack(
                      children: <Widget>[
                        Positioned(
                          right: -40.0,
                          top: -40.0,
                          child: InkResponse(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: CircleAvatar(
                              child: Icon(Icons.close),
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ),
                        Form(
                          key: _formkey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: _textFieldController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Enter Deposit Amount',
                                    icon: Icon(Icons.monetization_on)
                                  ),
                                  validator: (value){
                                    if(value != ""){
                                      if(int.parse(value.toString()) < 10){
                                        return "Amount must morethan 10\$";
                                      }
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MaterialButton(
                                  color: Colors.green,
                                  child: Text("Deposit",style: TextStyle(color: Colors.white),),
                                  onPressed: ()async {
                                    if (_formkey.currentState!.validate()) {
                                      _formkey.currentState!.save();
                                      print('State is valid');
                                      String accessToken = Provider.of<UserProvider>(context, listen: false).user.accessToken;
                                      _DepositTransaction(accessToken,depositAddress.address,_textFieldController.text);
                                      Navigator.of(context).pop();
                                    }
                                    else{
                                      print('State is no valid');
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
          child: Container(
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
        ),
        Container(width:100,height:25,child: Text(depositAddress.address,style: TextStyle(fontSize: 10),))
      ],
    );
  }

  void _DepositTransaction(String token,String link,String depositamount)async{
    print('Deposit data --->');
    print( link + " , " + depositamount );


    // create user
    // call register method in User Provider
    // User user = User(id: id, name: name, email: email, password: password, referCode: referCode, phone: phone, img: img, address: address, remark: remark, accessToken: accessToken, createdAt: createdAt, modifiedAt: modifiedAt)
    LoadingDialog.show(context);
    String status = await Provider.of<WalletProvider>(context, listen:false).requestDepositTransactionPlz(accessToken: token, link: link, depositAmount: double.parse(depositamount));
    // close loading dialog
    LoadingDialog.hide(context);
    if(status == "success"){
      // Navigator.pushNamed(context, HomePage.routeName);
      Fluttertoast.showToast(
          msg: "Successfully Created New Deposit!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
      );
      //showAlertDialog(context, "Verify Email", "Check your email inbox and click on verification link", Colors.red, (){});
    }
    else{
      print('Status is -->');
      print(status);
      Fluttertoast.showToast(
          msg: status,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
      );
      // show error message
      // showAlertDialog(context, "Login Fail", "Please check email , password and Try Again!", Colors.red, (){});
      //showAlertDialog(context, "Something went wrong", "Contact to facebook page for Approval!!", Colors.red, (){});
    }

    // Navigator.pop(context);
  }

  void _WithdrawTransaction(String token,String address,String withdrawamount)async{
    print('Withdraw data --->');
    print( address + " , " + withdrawamount );
    LoadingDialog.show(context);
    String status = await Provider.of<WalletProvider>(context, listen:false).requestWithdrawTransactionPlz(accessToken: token, withdrawAddress: address, withdrawAmount: double.parse(withdrawamount));
    // close loading dialog
    LoadingDialog.hide(context);
    if(status == "success"){
      // Navigator.pushNamed(context, HomePage.routeName);
      Fluttertoast.showToast(
          msg: "Successfully Created New Withdraw!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
      );
      //showAlertDialog(context, "Verify Email", "Check your email inbox and click on verification link", Colors.red, (){});
    }
    else{
      print('Status is -->');
      print(status);
      Fluttertoast.showToast(
          msg: status,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
      );
      // show error message
      // showAlertDialog(context, "Login Fail", "Please check email , password and Try Again!", Colors.red, (){});
      //showAlertDialog(context, "Something went wrong", "Contact to facebook page for Approval!!", Colors.red, (){});
    }

    // Navigator.pop(context);
  }
}


