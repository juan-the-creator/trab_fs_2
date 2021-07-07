import 'dart:io';
import 'package:flutter/material.dart';
import 'package:trab_fs_2/screens/choose_difficulty.dart';
import 'package:trab_fs_2/screens/credits.dart';
import 'package:trab_fs_2/screens/help_screen.dart';
import 'package:trab_fs_2/widgets/c_app_bar.dart';
import 'package:trab_fs_2/widgets/c_button.dart';
import 'package:trab_fs_2/widgets/c_button_exit.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar("JOGO DAS SÍLABAS"),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CButton(
                btnText: "JOGAR!",
                callback: () {
                  play(context);
                }),
            SizedBox(height: 50),
            CButton(
                btnText: "AJUDA",
                callback: () {
                  help(context);
                }),
            SizedBox(height: 10),
            CButton(
                btnText: "CRÉDITOS",
                callback: () {
                  credits(context);
                }),
            SizedBox(height: 50),
            CButtonExit(btnText: "< SAIR", callback: quit)
          ],
        ),
      ),
    );
  }

  void play(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DiffScreen()),
    );
  }

  void help(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HelpScreen()),
    );
  }

  void credits(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Credits()),
    );
  }

  void quit() {
    exit(0);
  }
}
