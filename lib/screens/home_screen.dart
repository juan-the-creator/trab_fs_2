import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trab_fs_2/widgets/big_word.dart';
import 'package:trab_fs_2/widgets/c_app_bar.dart';
import 'package:trab_fs_2/widgets/c_button.dart';
import 'package:trab_fs_2/widgets/c_button_exit.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CAppBar(),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CButton(btnText: "JOGAR!"),
              SizedBox(height: 50),
              CButton(btnText: "AJUDA"),
              SizedBox(height: 10),
              CButton(btnText: "DIFICULDADE"),
              SizedBox(height: 10),
              CButton(btnText: "CRÉDITOS"),
              SizedBox(height: 50),
              CButtonExit(btnText: "< SAIR", callback: quit)
            ],
          ),
        ),
      ),
    );
  }
}

void quit() {
  exit(0);
}
