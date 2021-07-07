import 'package:flutter/material.dart';

class BigWord extends StatelessWidget {
  final String word;
  const BigWord({Key? key, this.word = "PALAVRA"}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(this.word,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontFamily: "Karla",
          fontSize: 48,
        ));
  }
}
