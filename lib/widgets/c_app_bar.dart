import 'package:flutter/material.dart';

class CAppBar extends AppBar {
  CAppBar(text)
      : super(
            shape: Border(
                bottom: BorderSide(color: Colors.black, width: 1.75),
                right: BorderSide(color: Colors.black, width: 1.75),
                top: BorderSide(color: Colors.black, width: 1.75),
                left: BorderSide(color: Colors.black, width: 1.75)),
            elevation: 0,
            centerTitle: true,
            title: Text(text,
                style: TextStyle(
                    color: Color(0xFF333333),
                    fontFamily: "Karla",
                    fontSize: 24)),
            backgroundColor: Color(0xFF96fcb1));
}
