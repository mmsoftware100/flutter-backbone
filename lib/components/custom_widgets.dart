import 'package:flutter/material.dart';

class CustomWidgets {
  static Widget socialButtonCircle(color, icon, {iconColor, Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: 50,
            height: 50,
            // padding: const EdgeInsets.all(20.0),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
              color: color,
            ),
            child: Center(
              child: Icon(
                icon,
                color: iconColor,
              ),
            )),
      ), //
    );
  }
}