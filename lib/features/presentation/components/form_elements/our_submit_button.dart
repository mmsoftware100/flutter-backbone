import 'package:flutter/material.dart';

class OurSubmitButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;
  final Color color;
  final Color textColor;
  final double width;
  final bool link;
  const OurSubmitButton(
      {Key? key,
        required this.callback,
        required this.text,
        this.color = const Color.fromARGB(255, 252, 213, 70),
        this.textColor = Colors.white,
        this.width = double.infinity,
        this.link = false
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _mainWidget(context);
  }


  Widget _mainWidget(BuildContext context){

    return InkWell(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 16.0),
        width: MediaQuery.of(context).size.width * width,
        //height: 50,
        decoration: BoxDecoration(
            color: color, //Colors.green,
            borderRadius: BorderRadius.circular(24.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]

        ),
        child: Center(child: Text(text, style: TextStyle(height: 1.0, color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 16.0),)),
      ),
    );
  }
  Widget _orgWidget(){
    if (link) {
      return TextButton(
        onPressed: callback,
        child: Text(text),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: callback,
          child: Text(text),
        ),
      ),
    );
    return ButtonTheme(
      minWidth: 500.0,
      height: 100.0,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(text),
      ),
    );
    return ElevatedButton(
      onPressed: callback,
      child: Text(text),
    );
  }
}
