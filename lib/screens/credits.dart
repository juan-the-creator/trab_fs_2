import 'package:flutter/material.dart';
import 'package:trab_fs_2/screens/help_screen.dart';
import 'package:trab_fs_2/widgets/big_word.dart';
import 'package:trab_fs_2/widgets/c_app_bar.dart';
import 'package:trab_fs_2/widgets/c_button_exit.dart';

class Credits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CAppBar("CRÉDITOS"),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),

              BigWord(word: "Créditos"),

              SizedBox(
                height: 70,
              ),

              TextFlexSize(
                word: "Desenvolvedores",
                fontSize: 46,
                bold: true,
              ),
              TextFlexSize(word: "Juan Pablo, Luiz Eduardo e Pedro Augusto"),
              SizedBox(height: 30),

              CButtonExit(
                  btnText: "< VOLTAR",
                  callback: () {
                    back(context);
                  }) // adicionar aqui o callback de voltar pra tela anterior
            ],
          ),
        ),
      ),
    );
  }

  void back(BuildContext context) {
    Navigator.pop(context);
  }
}
