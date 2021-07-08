import 'package:flutter/material.dart';
// import 'package:trab_fs_2/widgets/CAppBar.dart';
import 'package:trab_fs_2/widgets/CAppBarButtons.dart';
import 'package:trab_fs_2/widgets/CButton.dart';
// import 'package:trab_fs_2/widgets/CButtonExit.dart';
import 'package:trab_fs_2/widgets/CField.dart';

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
        appBar: CAppBarButtons(),
        body: Column(
          children: [
            CButton(btnText: "JOGAR!"),
            Row(
              children: [CField(), CField(), CField(), CField()],
            )
          ],
        ),
      ),
    );
  }
}
