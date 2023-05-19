import 'package:base/features/data/const/data.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  static String routeName = "/LandingPage";
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return _mainWidget();
  }

  Widget _mainWidget(){
    return Column(
      children: [
        _languageBar(),
        _imageTwo(),
        _imageThreeFour(),
        _imageFive(),
        _buttonRow(),
        _imageTen(),
        _tncRow()
      ],
    );
  }

  Widget _languageBar(){
    return Placeholder(fallbackHeight: 50,);
  }
  Widget _imageTwo(){
    return Image.asset(image2AssetUrl);
  }
  Widget _imageThreeFour(){
    return Image.asset(image34AssetUrl);
  }
  Widget _imageFive(){
    return Image.asset(image5AssetUrl);
  }
  Widget _buttonRow(){
    return Row(
      children: [
        Container(),
        Column(
          children: [
            _registerButton(),
            _dividerRow(),
            _loginLink()
          ],
        )
      ],
    );
  }

  Widget _registerButton(){
    return ElevatedButton(onPressed: (){}, child: Text("Register"));
  }

  Widget _dividerRow(){
    return Row(
      children: [
        // TODO: horizontal ruler
        // hr : Divider is hr
        Divider(),
        Text("or"),
        Divider(),
        // hr
      ],
    );
  }

  Widget _loginLink(){
    return TextButton(onPressed: (){}, child: Text("Login"));
  }
  Widget _imageTen(){
    return Image.asset(image10AssetUrl);
  }
  Widget _tncRow(){
    return Row(
      children: [
        // check box

        // text
        Text("I have to agree to Terms and Condition Policy"),

        //
        Container()

      ],
    );
  }
}
