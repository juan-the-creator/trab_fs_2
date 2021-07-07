import 'package:flutter/material.dart';
import 'package:trab_fs_2/screens/game_screen_easy.dart';
import 'package:trab_fs_2/screens/game_screen_hard.dart';
import 'package:trab_fs_2/screens/game_screen_medium.dart';
import 'package:trab_fs_2/widgets/big_word.dart';
import 'package:trab_fs_2/widgets/c_app_bar.dart';
import 'package:trab_fs_2/widgets/c_button.dart';
import 'package:trab_fs_2/widgets/c_button_exit.dart';

class DiffScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CAppBar("JOGO DAS SÍLABAS"),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BigWord(word: "ESCOLHA A DIFICULDADE!"),
              SizedBox(height: 30),
              CButton(
                btnText: "FACIL",
                callback: () {
                  easy(context);
                }, // callback com o parâmetro fácil
              ),
              SizedBox(height: 10),
              CButton(
                  btnText: "NORMAL",
                  callback: () {
                    medium(context);
                  }), // callback normal
              SizedBox(height: 10),
              CButton(
                  btnText: "DIFÍCIL",
                  callback: () {
                    hard(context);
                  }), // callback dark souls
              SizedBox(height: 50),
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

  void easy(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameEasy()),
    );
  }

  void medium(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameMedium()),
    );
  }

  void hard(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameHard()),
    );
  }

  void back(BuildContext context) {
    Navigator.pop(context);
  }
}
