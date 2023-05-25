import 'package:flutter/material.dart';

import '../../data/const/data.dart';

class ClaimPointPage extends StatefulWidget {
  static String routeName = "/ClaimPointPage";
  const ClaimPointPage({Key? key}) : super(key: key);

  @override
  State<ClaimPointPage> createState() => _ClaimPointPageState();
}

class _ClaimPointPageState extends State<ClaimPointPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        title: Text("FUMO"),
      ),

       */
      body: _mainWidget(),
    );
  }

  Widget _mainWidget(){
    return ListView(
        children: [
          _pointContainer(),
          _claimContainer()
        ],
    );
  }

  Widget _pointContainer(){
    return Stack(
      alignment: Alignment.center,
      children: [
        _pointBackgroundImage(),
        _pointText()
      ],
    );
  }

  Widget _pointBackgroundImage(){
    return Image.asset(pointBackgroundAssetUrl);
  }
  
  Widget _pointText(){
    return Text("10.2", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 2.0),);
  }

  Widget _claimContainer(){
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        _claimBackground(),
        _claimButton(),
      ],
    );
  }
  
  Widget _claimButton(){
    return ElevatedButton(onPressed: (){}, child: Text("CLAIM" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),) ,);
  }
  
  Widget _claimBackground(){
    return Image.asset(
        claimBackgroundAssetUrl,
        fit: BoxFit.fill,
    );
  }
}
