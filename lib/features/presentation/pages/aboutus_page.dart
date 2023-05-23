import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  static String routeName = "/AboutUsPage";
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("FUMO",style: TextStyle(color: Colors.white),),),
      body: _mainWidget(),
    );
  }
  Widget _mainWidget(){
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                // width: MediaQuery.of(context).size.width * 0.95,
                // height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/FUMO-About-us-1.jpg')
                  ),
                ),
              ),
            ),
            Container(
              // width: MediaQuery.of(context).size.width * 0.95,
              // height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage('assets/images/FUMO-About-us-2.jpg')
                ),
              ),
            ),
            Container(
              // width: MediaQuery.of(context).size.width * 0.95,
              // height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage('assets/images/FUMO-About-us-3.jpg')
                ),
              ),
            ),
            Container(
              // width: MediaQuery.of(context).size.width * 0.95,
              // height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage('assets/images/FUMO-About-us-4.jpg')
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
