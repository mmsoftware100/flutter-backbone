import 'package:flutter/material.dart';

final Color facebookColor = const Color(0xff39579A);
final Color twitterColor = const Color(0xff00ABEA);
final Color instaColor = const Color(0xffBE2289);
final Color whatsappColor = const Color(0xff075E54);
final Color linkedinColor = const Color(0xff0085E0);
final Color githubColor = const Color(0xff202020);
final Color googleColor = const Color(0xffDF4A32);
final Color appleColor = const Color(0xffE5E5E7);

int getColorHexFromStr(String colorStr) {
  colorStr = "FF" + colorStr;
  colorStr = colorStr.replaceAll("#", "");
  int val = 0;
  int len = colorStr.length;
  for (int i = 0; i < len; i++) {
    int hexDigit = colorStr.codeUnitAt(i);
    if (hexDigit >= 48 && hexDigit <= 57) {
      val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 65 && hexDigit <= 70) {
      // A..F
      val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 97 && hexDigit <= 102) {
      // a..f
      val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
    } else {
      throw new FormatException("An error occurred when converting a color");
    }
  }
  return val;
}
