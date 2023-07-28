/* Military Theme */
import 'package:flutter/material.dart';

/* OOAK Theme */

/*
const primaryColor = Color(0xffdeb068); //Color(0xff4d784e);
const secondaryColor = Color.fromRGBO(143, 95, 67, 1.0); // Color(0xff6ea171);
const textColor =  Color(0xff000000); //Color(0xff01a75e);//Color(0xffe1d798);
const backUpColor = Color(0xff675645);
const finalColor = Color(0xff424756);
const surfaceWhite = Color(0xFFFFFBFA);
const backgroundColor = Colors.white; //  Colors.white; // Color(0xffdeb068); //Colors.white;
const errorColor = Colors.red;

 */

// Color(0xffFFC773);


Color primaryColor =  Colors.black54; //Color(0xfff2eb91); //Color(0xff4d784e);
Color secondaryColor = Colors.black54; //Color(0xffffffff); // Color(0xff6ea171);
Color surfaceColor = Colors.black54; //Color(0xffffffff);
Color backgroundColor = Color(0xff000000); // Color(0xfff5b700);
Color errorColor = Color(0xfff80000);
Color textColor = Color(0xff000000);
Color textBodyColor = Color(0xff000000);
Color onPrimaryColor = Color(0xffffffff);
Color onSecondaryColor = Color(0xffffffff);
Color onSurfaceColor = Color(0xffffffff);
Color onBackgroundColor = Color(0xffffffff);
const iconColor = Colors.black;



TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(

    headline5: base.headline5!.copyWith(
      fontWeight: FontWeight.w500,
    ),
    headline6: base.headline6!.copyWith(
      fontSize: 18.0,
    ),
    caption: base.caption!.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    bodyText1: base.bodyText1!.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),

  ).apply(
    /*
    fontFamily: 'MyanmarPhetsot',

     */
    displayColor: textColor,
    bodyColor: textBodyColor,
  );
}

ThemeData _buildTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    // scaffoldBackgroundColor: backgroundColor,
    colorScheme: base.colorScheme.copyWith(

        primary: primaryColor,
        onPrimary: onPrimaryColor,
        secondary: secondaryColor,
        onSecondary: onSecondaryColor,
        error: errorColor,
        background: backgroundColor,
        surface: surfaceColor,
        onBackground: onBackgroundColor,
        onSurface: onSurfaceColor

    ),
    textTheme: _buildTextTheme(base.textTheme),
    /*
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: textColor,
    ),

     */
    iconTheme: const IconThemeData(color: iconColor),

    // TODO: Add the text themes (103)
    // TODO: Add the icon themes (103)
    // TODO: Decorate the inputs (103)
  );
}

ThemeData newsTheme = _buildTheme();