import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Fbutton extends StatelessWidget {
  final String text;
  final void Function() my_onpressed;
  const Fbutton({Key? key, required this.text, required this.my_onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextButton(
        child: Text(
          text,
        ),
        onPressed: my_onpressed,
        style: TextButton.styleFrom(
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          primary: Colors.white,
        ));
  }
}
