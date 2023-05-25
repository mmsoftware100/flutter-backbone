import 'package:flutter/material.dart';

class OurDrawer extends StatefulWidget {
  const OurDrawer({Key? key}) : super(key: key);
  static final List<String> _listViewData = [
    "Home",
    "Payment",
    "Account",
    "Help",
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
                                          leading: _currentSelected == 0 ? Icon(Icons.home) : _currentSelected == 1 ? Icon(Icons.payment): _currentSelected == 2 ? Icon(Icons.account_circle):_currentSelected == 3 ? Icon(Icons.help):Icon(Icons.settings),
                                          title: Text(OurDrawer._listViewData[index]),
                                              onTap: () {
                                                setState(() {
                                                _currentSelected = index;
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
