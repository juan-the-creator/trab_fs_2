import 'package:flutter/material.dart';
import 'package:trab_fs_2/widgets/big_word.dart';
import 'package:trab_fs_2/widgets/c_app_bar_buttons.dart';
import 'package:trab_fs_2/widgets/c_button.dart';
import 'package:trab_fs_2/widgets/c_button_exit.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ajuda",
      home: Scaffold(
        appBar: CAppBarButtons("VOLTAR", () {
          home(context);
        }, "", () {}),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                BigWord(word: "Como jogar"),
                SizedBox(
                  height: 10.0,
                ),
                TextFlexSize(
                  word:
                      'Para iniciar o jogo, no menu inicial, clique no botão Jogar. Em seguida, escolha a dificuldade desejada e o jogo será iniciado. Uma palavra aleatória será exibida, e você deverá escrever em cada quadradinho branco quais as sílabas pertecem a ele. Note que a quantidade de quadradinhos brancos refletem na quantidade de sílabas da palavra.',
                ),
                SizedBox(
                  height: 10.0,
                ),
                BigWord(word: "Regras de divisão silábica"),
                TextFlexSize(
                  word: 'Separam-se:',
                  bold: true,
                ),
                TextFlexSize(word: 'Vogais idênticas, como ca-fe-ei-ra.'),
                TextFlexSize(word: 'Hiatos, como di-a.'),
                TextFlexSize(
                    word: 'Dígrafos (rr, ss, sc, sç, xc), como des-ci-da.'),
                SizedBox(
                  height: 10.0,
                ),
                TextFlexSize(
                  word: 'Não se separam:',
                  bold: true,
                ),
                TextFlexSize(word: 'Ditongos, como i-dei-a.'),
                TextFlexSize(word: 'Tritongos, como u-ru-guai.'),
                TextFlexSize(
                    word: 'Dígrafos (ch, lh, nh, qu, gu), como cha-ve.'),
                TextFlexSize(
                    word:
                        'Encontros Consonantais Perfeitos, como a-tlân-ti-co.'),
                SizedBox(height: 20),
                CButton(
                    btnText: 'Veja mais exemplos aqui!', callback: _launchURL),
                SizedBox(height: 20),
                CButtonExit(
                    btnText: "Voltar",
                    callback: () {
                      back(context);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void home(BuildContext context) {
    Navigator.pop(context);
  }

  void help(BuildContext context) {
    Navigator.pop(context);
  }

  void back(BuildContext context) {
    Navigator.pop(context);
  }

  final _url = 'https://www.todamateria.com.br/separacao-silabica/';
  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}

class TextFlexSize extends StatelessWidget {
  final String word;
  final double fontSize;
  final bool bold;
  const TextFlexSize(
      {Key? key, this.word = "PALAVRA", this.fontSize = 24, this.bold = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      word,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: bold ? FontWeight.w900 : FontWeight.normal,
        // fontFamily: "Karla",
      ),
    );
  }
}
