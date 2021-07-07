import 'package:flutter/material.dart';

class CAppBarButtons extends AppBar {
  CAppBarButtons(textLeft, btnLeft, textRight, btnRight)
      : super(
            shape: Border(
                bottom: BorderSide(color: Colors.black, width: 1.75),
                right: BorderSide(color: Colors.black, width: 1.75),
                top: BorderSide(color: Colors.black, width: 1.75),
                left: BorderSide(color: Colors.black, width: 1.75)),
            elevation: 0,
            centerTitle: false,
            backgroundColor: Color(0xFF96fcb1),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: btnLeft,
                  child: Text(textLeft,
                      style: TextStyle(
                          color: Color(0xFF333333),
                          fontFamily: "Karla",
                          fontSize: 16)),
                ),
                TextButton(
                  onPressed: btnRight,
                  child: Text(textRight,
                      style: TextStyle(
                          color: Color(0xFF333333),
                          fontFamily: "Karla",
                          fontSize: 16)),
                )
              ],
            ));
}
