import 'dart:io';

import 'package:base/core/util/loading_dialog.dart';
import 'package:base/features/domain/entities/deposit_address.dart';
import 'package:base/features/presentation/components/page_title.dart';
import 'package:base/features/presentation/pages/user_login_test_page.dart';
import 'package:base/features/presentation/providers/dashboard_provider.dart';
import 'package:base/features/presentation/providers/user_provider.dart';
import 'package:base/features/presentation/providers/wallet_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as p;
import 'package:permission_handler/permission_handler.dart';
import '../../domain/entities/dashboard.dart';
import '../../domain/entities/user.dart';
import 'package:gallery_saver/gallery_saver.dart';

class WalletPage extends StatefulWidget {
  static String routeName = "/WalletPage";
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<WalletPage> {
  String valueText = "";
  TextEditingController _textFieldController = new TextEditingController();
  TextEditingController _walletaddressController = new TextEditingController();
  bool checktext = false;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();

  }

  @override
  void didChangeDependencies() {
    // Provider.of<>(context)
    super.didChangeDependencies();
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    Directory appDocDir = await getApplicationDocumentsDirectory();
    String imagesAppDirectory = appDocDir.path;
    final file =
    await File('$imagesAppDirectory/$path').create(recursive: true);

    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  Future<void> saveImageF(String ImagDetails,String imagelinkInAssets) async {
    final permissionStatus = await Permission.storage.status;
    if (permissionStatus.isDenied) {
      // Here just ask for the permission for the first time
      await Permission.storage.request();

      // I noticed that sometimes popup won't show after user press deny
      // so I do the check once again but now go straight to appSettings
      if (permissionStatus.isDenied) {
        await openAppSettings();
      }
    } else if (permissionStatus.isPermanentlyDenied) {
      // Here open app settings for user to manually enable permission in case
      // where permission was permanently denied
      await openAppSettings();
    } else {
      // Do stuff that require permission here
      String imgPath = imagelinkInAssets;
      print(imagelinkInAssets);
      print(imgPath);
      late File image;
      await getImageFileFromAssets(imgPath).then((file) => image = file);
      print(image);
      print('File Check');
      final result = await _checkFileExists(image.path);
      print(result);
      final extDir = await getExternalStorageDirectory();
      //final extDir = await getTemporaryDirectory();
      // Directory extDir = await getApplicationDocumentsDirectory();
      // print(extDir.path);
      print('My Path');
      //Directory? directory = Directory('/storage/emulated/0/DCIM/Camera');
      // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
      // ignore: avoid_slow_async_io
      // if (!await directory.exists()) directory = await getExternalStorageDirectory();
      // print(directory?.path);
      // final externalStorageFolder = await getExternalStorageDirectory();
      // if (externalStorageFolder != null) {
      //   downloadDirectory = p.join(externalStorageFolder.path, "Downloads");
      // }
      //print(downloadDirectory);
      // Path of file in android data files
      final myImagePath = '${extDir!.path}';
      //final myImagePath = directory?.path;
      print('This is extDir');
      final result2 = await _checkDirectoryExists(myImagePath.toString());
      print(result2);
      print(myImagePath);

      // create the base name
      //String basename = (ImagDetails).substring(20);
      String basename = ImagDetails+".png";

      // File copied to ext directory.
      File newImage = await image.copy("$myImagePath/${basename}");

      print(newImage.path);
      GallerySaver.saveImage(newImage.path).then((bool? success) {
      });
      Fluttertoast.showToast(
          msg: "QR Image Saved in Gallery",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    // String imgPath = imagelinkInAssets.substring(7);

  }
  Future<String?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
        // ignore: avoid_slow_async_io
        if (!await directory.exists()) directory = await getExternalStorageDirectory();
      }
    } catch (err, stack) {
      print("Cannot get download folder path");
    }
    return directory?.path;
  }
  Future<bool> _checkFileExists(String path) {
    return File(path).exists();
  }

  Future<bool> _checkDirectoryExists(String path) {
    return Directory(path).exists();
  }

  void _init()async{
    print("_init");
    // Navigator.pushNamed(context, TestPage.routeName);
    print(Provider.of<UserProvider>(context, listen: false).user.wallet_address);
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
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(

          children: [
            PageTitle(title: "Wallet", iconData: Icons.wallet_outlined),
            /*
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

             */
            // Center(
            //   child: InkWell(
            //     onTap: ()async{
            //       LoadingDialog.show(context);
            //       await Provider.of<UserProvider>(context, listen: false).logout();
            //       // hide loading screen
            //
            //       LoadingDialog.hide(context);
            //       Navigator.pushNamed(context, UserLoginPage.routeName);
            //     },
            //     child: Container(
            //       width: double.infinity,
            //       child: Row(
            //         children: [
            //           Expanded(child: Container()),
            //           Icon(Icons.logout_sharp,size: 30.0,color: Colors.red,),
            //           Text('Logout',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.red),).tr(),
            //           SizedBox(width: 24.0,)
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
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
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          )
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
            SizedBox(height: 10.0,),
            user.wallet_address == "wallet_address" ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: TextFormField(
                    controller: _walletaddressController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.wallet),
                      labelText: "Enter Your Wallet Address",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 50), backgroundColor: Colors.indigoAccent),
                  onPressed: () async {
                      if(_walletaddressController.text == ""){
                        showAlertDialog(context, "Wallet Address!", "you need to enter your wallet address", Colors.red, () { });
                        return;
                      }
                      User user = Provider.of<UserProvider>(context, listen: false).user;
                      user.wallet_address = _walletaddressController.text;
                      LoadingDialog.show(context);
                      String status = await Provider.of<UserProvider>(context, listen: false).userUpdatePlz(
                          username: user.username,
                          email: user.email,
                          phone: user.phone,
                          profile_picture: user.profile_picture,
                          address: user.address,
                          remark: user.remark,
                          password: user.password,
                          level: user.level,
                          accessToken: user.accessToken,
                          wallet_address: user.wallet_address,
                          deposit_address: user.deposit_address,
                          referCode: user.referCode
                      );
                      user = Provider.of<UserProvider>(context, listen: false).user;
                      LoadingDialog.hide(context);
                    },
                  child: Text(
                    "Add",
                  ),
                )
              ],
            )
            : Row(
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
                                                Navigator.of(context).pop();
                                                LoadingDialog.show(context);
                                                _WithdrawTransaction(accessToken,user.wallet_address,_textFieldController.text);
                                                LoadingDialog.hide(context);
                                                //Navigator.of(context).pop();
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
                      padding: EdgeInsets.all(24.0),
                      width: MediaQuery.of(context).size.width * 0.8,
                      // height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.teal,
                            blurRadius: 10.0, // soften the shadow
                            spreadRadius: 0.0, //extend the shadow
                            offset: Offset(
                              5.0, // Move to right 10  horizontally
                              5.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],

                        /*
                        boxShadow: [
                          BoxShadow(color: Colors.grey, spreadRadius: 3),
                        ],

                         */
                      ),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Wallet Address",style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                          SizedBox(height: 24,),
                          Text(user.wallet_address,style: TextStyle(fontSize: 12),textAlign: TextAlign.center,)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0,)
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
                              Padding(padding: EdgeInsets.all(8.0),
                                child: Container(
                                  // width: MediaQuery.of(context).size.width * 0.95,
                                  // height: MediaQuery.of(context).size.height * 0.25,
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: depositAddress.name == "MATIC" ? AssetImage('assets/images/MATIC.png') : depositAddress.name == "BNB" ? AssetImage('assets/images/BNB.png') : AssetImage('assets/images/TRX.png')
                                    ),
                                  ),
                                ),
                              ),
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
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: MaterialButton(
                                      color: Colors.green,
                                      child: Text("Save QR",style: TextStyle(color: Colors.white),),
                                      onPressed: ()async {
                                        print('Save QR');
                                        if(depositAddress.name == "MATIC"){
                                          saveImageF(depositAddress.name,"images/MATIC.png");
                                        }else if(depositAddress.name == "BNB"){
                                          saveImageF(depositAddress.name, "images/BNB.png");
                                        }
                                        else{
                                          saveImageF(depositAddress.name,"images/TRX.png");
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

                                          if(_textFieldController.text != "" && depositAddress.address != ""){
                                            _DepositTransaction(accessToken,depositAddress.address,_textFieldController.text);
                                          }
                                          Navigator.of(context).pop();
                                        }
                                        else{
                                          print('State is no valid');
                                        }
                                      },
                                    ),
                                  ),
                                ],
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
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
              color: depositAddress.name == "MATIC" ? Colors.amber : depositAddress.name == "BNB" ? Colors.teal : Colors.blueAccent,
              width: 5,
              ),
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
    if(link != "" && depositamount != ""){
      LoadingDialog.show(context);
      String status = await Provider.of<WalletProvider>(context, listen:false).requestDepositTransactionPlz(accessToken: token, link: link, depositAmount: double.parse(depositamount));
      // close loading dialog
      LoadingDialog.hide(context);
      if(status == "success"){
        // Navigator.pushNamed(context, HomePage.routeName);
        Fluttertoast.showToast(
            msg: "Successfully Created New Deposit! Please Wait 24 hours.. We will check your Deposit...",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
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
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0
        );
        // show error message
        // showAlertDialog(context, "Login Fail", "Please check email , password and Try Again!", Colors.red, (){});
        //showAlertDialog(context, "Something went wrong", "Contact to facebook page for Approval!!", Colors.red, (){});
      }
    }

    // create user
    // call register method in User Provider
    // User user = User(id: id, name: name, email: email, password: password, referCode: referCode, phone: phone, img: img, address: address, remark: remark, accessToken: accessToken, createdAt: createdAt, modifiedAt: modifiedAt)


    // Navigator.pop(context);
  }

  void _WithdrawTransaction(String token,String address,String withdrawamount)async{
    print('Withdraw data --->');
    print( address + " , " + withdrawamount );
    //Navigator.pop(context);

    String status = await Provider.of<WalletProvider>(context, listen:false).requestWithdrawTransactionPlz(accessToken: token, withdrawAddress: address, withdrawAmount: double.parse(withdrawamount));
    // close loading dialog
    //LoadingDialog.hide(context);
    if(status == "success"){
      // Navigator.pushNamed(context, HomePage.routeName);
      Fluttertoast.showToast(
          msg: "Successfully Withdraw Transition!, Please Wait 24 hours.. We will check your Withdraw...",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
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
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
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

  showAlertDialog(BuildContext context,String title, String info, Color color, VoidCallback callback) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK",style: TextStyle(color: color)),
      onPressed: () {
        Navigator.pop(context);
        callback();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(info, style: TextStyle(color: color),),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}


