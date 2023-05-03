import 'package:flutter/material.dart';

class OurAlertDialog{

  static void show(BuildContext context){
    showDialog(
        context: context,
        builder: (_) => WillPopScope(
          onWillPop: () async => true,
          child: SimpleDialog(
            title: Text("You need to login!"),
            //backgroundColor: Colors.transparent,
            //title: Container(height: 50, width: 50, child: _spinKit()),
            //content: _spinKit(),
            children: [
              Text("to add this goods to your cart, you need to login first")
              ],
          ),
        )
    );
  }
}