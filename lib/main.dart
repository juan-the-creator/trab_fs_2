import 'package:flutter/material.dart';
import 'package:trab_fs_2/widgets/CAppBar.dart';
import 'package:trab_fs_2/widgets/CButton.dart';
import 'package:trab_fs_2/widgets/CButtonExit.dart';

void main() {
  runApp(UITest());
}

class UITest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "UI Test",
      home: Scaffold(
        appBar: CAppBar(),
        body: Column(
          children: [
            CButton(btnText: "JOGAR!"),
            CButton(btnText: "AJUDA"),
            CButton(btnText: "REGRAS DE SEPARAÇÃO"),
            CButtonExit(
              btnText: "< SAIR",
            )
          ],
        ),
      ),
    );
  }
}
