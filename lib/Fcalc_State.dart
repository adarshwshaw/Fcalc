import 'dart:io';

import 'package:fcalc/Fbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './main.dart';

class Fcalc_State extends State<Fcalc> {
  final List<String> keys = [
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    '*',
    '1',
    '2',
    '3',
    '-',
    'C',
    '0',
    '=',
    '+'
  ];
  String disp = '0';
  double arg1 = 0;
  double arg2 = 0;
  String operation = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 20,
          leadingWidth: double.infinity,
          leading: Row(
            children: [
              TextButton(
                  onPressed: () {
                    print("quiting");
                    exit(0);
                  },
                  child: Text(
                    "Quit",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          )),
      body: Container(
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  disp,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              flex: 1,
            ),
            Divider(),
            Expanded(
                flex: 3,
                child: GridView.count(
                  crossAxisCount: 4,
                  children: [
                    for (var i in keys)
                      Fbutton(text: i, my_onpressed: () => pressed(i))
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void pressed(String _text) {
    setState(() {
      switch (_text) {
        case '+':
        case '-':
        case '*':
        case "/":
          operation = _text;
          arg1 = double.parse(disp);
          print(arg1);
          disp = "";
          break;
        case "=":
          switch (operation) {
            case "+":
              arg2 = double.parse(disp);
              disp = (arg1 + arg2).toString();
              break;
            case "-":
              arg2 = double.parse(disp);
              disp = (arg1 - arg2).toString();
              break;
            case "*":
              arg2 = double.parse(disp);
              disp = (arg1 * arg2).toString();
              break;
            case "/":
              arg2 = double.parse(disp);
              disp = (arg1 / arg2).toString();
              break;
          }
          break;
        case "C":
          arg1 = 0;
          arg2 = 0;
          disp = "";
          break;
        default:
          disp += _text;
          break;
      }
    });
  }
}
