import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);
  static final List<String> _listViewData = [
    "Home",
    "Payment",
    "Account",
    "Help",
    "Setting"
  ];
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int _currentSelected = 0;
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Container(
        child: ListView.builder(
        padding: EdgeInsets.all(10.0),
          itemCount: MyDrawer._listViewData.length,
          itemBuilder: (context, index) {
          return Container(
                                  color: _currentSelected == index ? Colors.deepPurple : Colors.white,
                                      child: ListTile(
                                        leading: _currentSelected == 0 ? Icon(Icons.home) : _currentSelected == 1 ? Icon(Icons.payment): _currentSelected == 2 ? Icon(Icons.account_circle):_currentSelected == 3 ? Icon(Icons.help):Icon(Icons.settings),
                                        title: Text(MyDrawer._listViewData[index]),
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
    );
  }
}
