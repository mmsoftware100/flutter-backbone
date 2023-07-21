import 'package:base/features/presentation/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';

class CalculatorPage extends StatefulWidget {
  static String routeName = "/CalculatorPage";
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  final _webViewKey = UniqueKey();
  final _progressKey = UniqueKey();
  double _progressValue = 0.0;

  String paymentTypeSelected = "";


  List<String> paymentTypeList = [
    "Level-1",
    "Level-2",
    "Level-3"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paymentTypeSelected = paymentTypeList.first;
    print(paymentTypeSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: _mainWidget(),
      ),
    );
  }

  Widget _mainWidget(){
    String lang = Provider.of<LanguageProvider>(context, listen:false).appLanguage.code;
    if(lang == "ch") lang  = "zh";
    if(lang == "jp") lang  = "ja";
    String url = "https://fumoinvest.org/profit_calculator/mobile?lang=$lang";


    print("url is $url");

    return Column(
      children: [
        LinearProgressIndicator(
          key: _progressKey,
          value: _progressValue,
          backgroundColor: Colors.green,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
        _progressValue < 1.0 ? Expanded(child: Center(child: CircularProgressIndicator(),)) :
        Expanded(
          child: WebView(
            key: _webViewKey,
            initialUrl: url, // Replace with your URL
            javascriptMode: JavascriptMode.unrestricted,
            onProgress: (progress) {
              setState(() {
                _progressValue = progress / 100;
              });
            },
            onPageFinished: (url) {
              setState(() {
                _progressValue = 0.0;
              });
            },
          ),
        ),
      ],
    );
    /*
    final WebViewController controller = WebViewController();
    controller.loadRequest(Uri.parse(url));

    return WebViewWidget(
        controller: controller,
    );

     */
    /*
    return InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(url)),
    );

     */
  }

  Widget _mainWidget2(){
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text("Profitablity Calculator",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),textAlign: TextAlign.center,))
              ],
            ),
            Container(
              width:MediaQuery.of(context).size.width,
              height: 100,
              child: Center(
                child: Text('It is a program for calculating the profit received from your purchased point.With the help of the calculator, you will find out the potential income from team',textAlign: TextAlign.center,),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right:20.0),
              child: Row(
                children: [
                  Text('What amount do you want to invest?'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right:20.0,top:10.0),
              child: TextField(
                // style: TextStyle(color: Colors.green),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your Amount',
                  filled: true,
                  fillColor: Colors.greenAccent,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right:20.0),
              child: Row(
                children: [
                  Text('Team rate'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right:20.0,top:10.0),
              child:  Container(
                decoration: BoxDecoration(
                  color: Colors.greenAccent, //<-- SEE HERE
                ),
                child: DropdownButton<String>(
                    isExpanded: true,
                    value: paymentTypeSelected,
                    items: paymentTypeList.map<DropdownMenuItem<String>>(
                            (e) => DropdownMenuItem<String>(child: Text(e), value: e,)
                    ).toList(),
                    onChanged: (String? value){
                      setState(() {
                        paymentTypeSelected = value ?? "";
                      });
                    }
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right:20.0),
              child: Row(
                children: [
                  Text('Number of months for invest'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right:20.0,top:10.0),
              child: TextField(
                // style: TextStyle(color: Colors.green),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.greenAccent,
                  hintText: 'Enter Number of months for invest',
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Container(
                child:  ElevatedButton(onPressed: () {}, child: const Text('Calculate'),style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent, foregroundColor: Colors.white, ),),
                // child: ElevatedButton(
                //   onPressed: () {
                //     debugPrint('ElevatedButton Clicked');
                //     // Navigator.pushNamedAndRemoveUntil(context, PaymentPage.routeName, (route) => false);
                //   },
                //
                //   style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent, foregroundColor: Colors.white, ),
                // ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.green, spreadRadius: 3),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Your Profit",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    SizedBox(height: 5,),
                    Text("1,000 USDT",style: TextStyle(fontSize: 23),textAlign: TextAlign.center,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
