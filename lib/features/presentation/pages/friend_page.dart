import 'package:flutter/material.dart';

import '../../data/const/data.dart';

class FriendPage extends StatefulWidget {
  static String routeName = "/FriendPage";
  const FriendPage({Key? key}) : super(key: key);

  @override
  State<FriendPage> createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FUMO"),
      ),
      body: _mainWidget(),
    );
  }

  Widget _mainWidget(){
    return SingleChildScrollView(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          _balanceInfo(),
          _friendImage(),
          _friendTable(),
          _inviteButton()
        ],
      ),
    );
  }

  Widget _balanceInfo(){
    return Column(
      children: [
        SizedBox(height: 36.0,),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      color: Colors.transparent,
                      child: Text("Total", style: TextStyle(color: Colors.orange),)
                  )
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.transparent,
                  child: Text(""),
                )
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                flex: 1,
                child: Container()
            ),
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("\$10.2", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.green)),
                  SizedBox(width: 8.0,),
                  Text("(+15%)", style: TextStyle(color: Colors.orange),)
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
  
  Widget _friendImage(){
    return Image.asset(friendImageAssetUrl);
  }

  Widget _friendTable(){
    return Table(
      columnWidths: {
        0: FractionColumnWidth(0.15),
        1: FractionColumnWidth(0.25),
        2: FractionColumnWidth(0.15),
        3: FractionColumnWidth(0.4),
      },
      children: [
        TableRow(
          children: [
            Text(""),
            Text("Friend"),
            Text("Detail"),
            Text("")
          ]
        ),
        _friendRow(),
        _friendRow(),
        _friendRow(),
        _friendRow(),
        _friendRow(),
        _friendRow(),
      ],
    );
  }

  TableRow _friendRow(){
    return TableRow(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(8.0),

      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(child: Icon(Icons.person),),
        ),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Text("Myowin99")
        ),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Text("(Level-1)")
        ),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Text("myowin98@email.com")
        )
      ]
    );
  }

  Widget _inviteButton(){
    return FloatingActionButton.extended(onPressed: (){}, label: Text("INVITE"), icon: Icon(Icons.person_add),);
  }
}
