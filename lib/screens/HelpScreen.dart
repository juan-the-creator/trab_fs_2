import 'package:flutter/material.dart';
import 'package:trab_fs_2/widgets/BigWord.dart';
import 'package:trab_fs_2/widgets/CAppBarButtons.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ajuda",
      home: Scaffold(
        appBar: CAppBarButtons(),
        body: Center(
          child: Column(
            children: const [
              BigWord(word: "Como jogar"),
              Text(
                  'Para iniciar o jogo, no menu inicial, clique no botão Jogar. Em seguida, escolha a dificuldade desejada e o jogo será iniciado.'),
              Text(
                  'Lhe será apresentado(a) uma palavra aleatória, e você deverá escrever em cada quadradinho branco quais as sílabas pertecem a ele.'),
              Text(
                  'Note que a quantidade de quadradinhos brancos refletem na quantidade de sílabas da palavra.'),
              SizedBox(
                height: 10.0,
              ),
              BigWord(word: "Regras de divisão silábica"),
              Text('Lembre-se, separam-se:'),
              Text('Vogais idênticas, como ca-fe-ei-ra.'),
              Text('Hiatos, como di-a.'),
              Text('Dígrafos (rr, ss, sc, sç, xc), como des-ci-da.'),
              Text('Não se separam:'),
              Text('Ditongos, como i-dei-a.'),
              Text('Tritongos, como u-ru-guai.'),
              Text('Dígrafos (ch, lh, nh, qu, gu), como cha-ve.'),
              Text('Encontros Consonantais Perfeitos, como a-tlân-ti-co.'),
              Text(
                  'Para mais exemplos, visite o site: https://www.todamateria.com.br/separacao-silabica/'),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
