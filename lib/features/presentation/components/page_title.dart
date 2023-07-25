import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String title;
  final IconData iconData;

  const PageTitle({
    Key? key,
    required this.title,
    required this.iconData
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0,right: 15.0),
      child: Container(
        padding: EdgeInsets.all(24.0),
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.red,
              blurRadius: 10.0, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
              offset: Offset(
                0.0, // Move to right 10  horizontally
                0.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(iconData,size: 30.0, color: Colors.white,),
            SizedBox(width: 24.0,),
            Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white),).tr(),
          ],
        ),
      ),
    );
  }
}
