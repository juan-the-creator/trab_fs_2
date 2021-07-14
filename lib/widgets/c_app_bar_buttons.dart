import 'package:flutter/material.dart';

class CAppBarButtons extends AppBar {
  CAppBarButtons()
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
                Text("VOLTAR PARA O INÍCIO",
                    style: TextStyle(
                        color: Color(0xFF333333),
                        fontFamily: "Karla",
                        fontSize: 16)),
                Text("AJUDA (?)",
                    style: TextStyle(
                        color: Color(0xFF333333),
                        fontFamily: "Karla",
                        fontSize: 16))
              ],
            ));
}
