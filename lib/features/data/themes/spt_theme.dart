/* Military Theme */
import 'package:flutter/material.dart';

Color primaryColor =  Colors.blue; //Color(0xfff2eb91); //Color(0xff4d784e);
Color secondaryColor = Colors.blue; //Color(0xffffffff); // Color(0xff6ea171);
Color surfaceColor = Colors.blue; //Color(0xffffffff);
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
    fontFamily: 'MyanmarPhetsot',
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

ThemeData sptTheme = _buildTheme();