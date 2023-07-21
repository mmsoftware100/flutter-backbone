import 'package:base/features/data/const/data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OurDrawer extends StatefulWidget {
  const OurDrawer({Key? key}) : super(key: key);
  static final List<String> _listViewData = [
  "Home",
    // "Payment",
    // "Account",
    // "Help",
    "Referral",
    "Earn",
    "Calculator",
    "Wallet",
    "Setting"
  ];
  @override
  State<OurDrawer> createState() => _OurDrawerState();
}

class _OurDrawerState extends State<OurDrawer> {
  int _currentSelected = 0;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Drawer(
        child: Container(
          child: ListView.builder(
          padding: EdgeInsets.all(10.0),
            itemCount: OurDrawer._listViewData.length,
            itemBuilder: (context, index) {
            return Container(
                                    color: _currentSelected == index ? Colors.deepPurple : Colors.white,
                                        child: ListTile(
                                          leading: index == 0 ? Icon(Icons.home) : index == 1 ? Icon(Icons.person_add): index == 2 ? Icon(Icons.currency_exchange):index == 3 ? Icon(Icons.calculate): index == 4 ? Icon(Icons.wallet) : Icon(Icons.settings),
                                          title: Text(OurDrawer._listViewData[index]).tr(),
                                              onTap: () {
                                                setState(() {
                                                _currentSelected = index;
                                                 menudrawer = _currentSelected;
                                                 print('menu drawer is '+menudrawer.toString());
                                                });

                                               },
                                        ),
            );
            },
          ),
        ),
      ),
    );
  }
}
