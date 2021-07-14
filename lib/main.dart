import 'package:flutter/material.dart';
import 'package:trab_fs_2/widgets/BigWord.dart';
// import 'package:trab_fs_2/widgets/CAppBar.dart';
import 'package:trab_fs_2/widgets/CAppBarButtons.dart';
import 'package:trab_fs_2/widgets/CButton.dart';
// import 'package:trab_fs_2/widgets/CButtonExit.dart';
import 'package:trab_fs_2/widgets/CField.dart';
import 'package:trab_fs_2/widgets/COverlay.dart';

void main() {
  runApp(UITest());
}

void printShit() {
  print("Shit");
}

class UITest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "UI Test",
      home: Scaffold(
        appBar: CAppBarButtons(),
        body: Column(
          children: [
            CButton(
              btnText: "PRINT!",
              callback: printShit,
            ),
            BigWord(
              word: "ABACATE",
            ),
            Row(
              children: [CField(), CField(), CField(), CField()],
            ),
            COverlay()
          ],
        ),
      ),
    );
  }
}
