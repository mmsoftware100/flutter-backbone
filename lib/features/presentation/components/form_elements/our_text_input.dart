import 'package:flutter/material.dart';

import '../../../../core/util/call_back_with_string.dart';

class OurTextInput extends StatefulWidget {

  final String label;
  final String placeHolder;
  final TextEditingController textEditingController;
  final CallBackWithString callback;
  final CallBackWithString submit;
  final TextInputType textInputType; // = TextInputType.number;
  final IconData icon;
  final bool password;
  // final IconData icon;

  OurTextInput({
    Key? key,
    required  this.label,
    required  this.placeHolder,
    required  this.textEditingController,
    required this.callback,
    required this.submit,
    this.textInputType = TextInputType.text,
    this.icon = Icons.description,
    this.password = false,
    // this.icon = Icons.description,
  }) : super(key: key);

  @override
  State<OurTextInput> createState() => _OurtextInputState();
}

class _OurtextInputState extends State<OurTextInput> {
  // bool show = false;
  bool passwordShow = false;

  void _togglePassword(){
    print("_togglePassword");
    setState(() {
      passwordShow = !passwordShow;
    });
  }

  Widget _showPasswordIcon(){
    return IconButton(onPressed: _togglePassword, icon: Icon(Icons.remove_red_eye));
  }
  Widget _hidePasswordIcon(){
    return IconButton(onPressed: _togglePassword, icon: Icon(Icons.remove_red_eye));
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordShow = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return _mainWidget();
  }


  Widget _mainWidget(){
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        // input container
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(

          ),
          child: Row(
            children: [
              // CircleAvatar(child: Icon(Icons.email,),),

              Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(360),
                    color: Colors.transparent,
                  ),
                  child: Icon(widget.icon,size: 20.0, color: Colors.transparent,)
              ),


              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.fromLTRB(36.0, 0, 0, 0),
                    child: TextField(
                      obscureText: passwordShow,
                      controller: widget.textEditingController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: widget.placeHolder,
                          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8))
                        //labelText: "label",
                      ),

                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // icon container
        Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(360),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(-2, 2), // changes position of shadow
                  ),
                ]
            ),
            child: Icon(widget.icon,size: 24.0, color: Colors.green,)
        ),
      ],
    );
  }
  Widget _orgWidget(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: widget.password,
        onSubmitted: widget.submit,
        keyboardType: widget.textInputType,
        onChanged: widget.callback,
        textInputAction: TextInputAction.search,
        controller: widget.textEditingController,
        // style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          // border: OutlineInputBorder(),

          // icon: Icon(Icons.lock), //icon at head of input
            prefixIcon: widget.icon == null ? null : Icon(widget.icon), //you can use prefixIcon property too
            //prefisIcon sets Icon inside the TextField border, 'icon' sets outside border.
            suffixIcon: widget.password ?
            passwordShow ? _hidePasswordIcon() : _showPasswordIcon()
                : null, //icon at tail of input
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black)
            ),

            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black)
            ),
            disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black)
            ),

            hintText: widget.placeHolder,
            labelText: widget.label,
            hintStyle: TextStyle(color: Colors.black54),
            labelStyle: TextStyle(color: Colors.black),
            fillColor: Colors.white
        ),
      ),
    );
  }
}


/*
class OurTextInput2 extends StatelessWidget {
  final String label;
  final String placeHolder;
  final TextEditingController textEditingController;
  final CallBackWithString callback;
  final CallBackWithString submit;
  final TextInputType textInputType; // = TextInputType.number;
  IconData? iconData;
  bool password;

  OurTextInput({
    Key? key,
    required  this.label,
    required  this.placeHolder,
    required  this.textEditingController,
    required this.callback,
    required this.submit,
    this.textInputType = TextInputType.text,
    this.iconData,
    this.password = false
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: password,
        onSubmitted: submit,
        keyboardType: textInputType,
        onChanged: callback,
        textInputAction: TextInputAction.search,
        controller: textEditingController,
        // style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          // border: OutlineInputBorder(),

            // icon: Icon(Icons.lock), //icon at head of input
            prefixIcon: iconData == null ? null : Icon(iconData), //you can use prefixIcon property too
            //prefisIcon sets Icon inside the TextField border, 'icon' sets outside border.
            suffixIcon: password ?  Icon(Icons.remove_red_eye) : null, //icon at tail of input
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black)
            ),

            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black)
            ),
            disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black)
            ),

            hintText: placeHolder,
            labelText: label,
            hintStyle: TextStyle(color: Colors.black54),
            labelStyle: TextStyle(color: Colors.black),
            fillColor: Colors.white
        ),
      ),
    );
  }
}

 */
