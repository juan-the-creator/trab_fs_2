import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trab_fs_2/widgets/big_word.dart';
import 'package:trab_fs_2/widgets/c_app_bar_buttons.dart';
import 'package:trab_fs_2/widgets/c_button.dart';
import 'package:trab_fs_2/widgets/c_field.dart';
import 'package:trab_fs_2/widgets/c_overlay.dart';
import 'package:collection/collection.dart';
import 'dart:math';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  //disgusting
  List<TextEditingController> textController =
      List.generate(5, (i) => TextEditingController());

  Function eq = const ListEquality().equals;

  late var word = loadWord();
  var lastN;
  var result = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CAppBarButtons(),
        body: Column(
          children: [
            BigWord(
              word: word['palavra'].toString().toUpperCase(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: buildFieldList(word['numSilabas']),
            ),
            CButton(
              btnText: "Verificar!",
              callback: verifySyllables,
            ),
            printResult(result),
            //verifySyllables(),
          ],
        ),
      ),
    );
  }

  void newGame() {
    word = loadWord();

    for (TextEditingController controller in textController) {
      controller.text = '';
    }
  }

  void verifySyllables() {
    word;
    var syllables = getInput();

    if (eq(word['silabas'], syllables)) {
      setState(() {
        result = 1;
      });
      Future.delayed(const Duration(milliseconds: 1500), () {
        newGame();

        setState(() {
          result = 0;
        });
      });
    } else {
      setState(() {
        result = 2;
      });
    }
    //print(result);
  }

  List getInput() {
    var input = [];
    for (TextEditingController controller in textController) {
      if (controller.text != '') input.add(controller.text.toLowerCase());
    }
    return input;
  }

  Widget printResult(input) {
    switch (input) {
      case 0:
        return SizedBox();
      case 1:
        return COverlay();
      case 2:
        return COverlay(
          message: 'Errado!',
          syllables: 'Tente novamente',
          color: const Color(0xFFD50000),
        );
    }

    return COverlay();
  }

  Map loadWord() {
    var words = [
      {
        "palavra": "abacate",
        "numSilabas": 4,
        "silabas": ["a", "ba", "ca", "te"]
      },
      {
        "palavra": "saída",
        "numSilabas": 3,
        "silabas": ["sa", "í", "da"]
      },
      {
        "palavra": "goiaba",
        "numSilabas": 3,
        "silabas": ["goi", "a", "ba"]
      },
      {
        "palavra": "chuveiro",
        "numSilabas": 3,
        "silabas": ["chu", "vei", "ro"]
      },
      {
        "palavra": "jabuticaba",
        "numSilabas": 5,
        "silabas": ["ja", "bu", "ti", "ca", "ba"]
      },
      {
        "palavra": "imperador",
        "numSilabas": 4,
        "silabas": ["im", "pe", "ra", "dor"]
      },
      {
        "palavra": "esperança",
        "numSilabas": 4,
        "silabas": ["es", "pe", "ran", "ça"]
      },
      {
        "palavra": "transportar",
        "numSilabas": 3,
        "silabas": ["trans", "por", "tar"]
      },
      {
        "palavra": "papagaio",
        "numSilabas": 4,
        "silabas": ["pa", "pa", "gai", "o"]
      },
      {
        "palavra": "terra",
        "numSilabas": 2,
        "silabas": ["ter", "ra"]
      },
    ];
    var n = new Random();
    var newN;
    do {
      newN = n.nextInt(10);
    } while (newN == lastN);
    lastN = newN;
    return words[newN];
  }

  List<Widget> buildFieldList(size) {
    //print(size);
    switch (size) {
      case 1:
        return [
          CField(
            textController: textController[0],
          )
        ];
      case 2:
        return [
          CField(
            textController: textController[0],
          ),
          CField(
            textController: textController[1],
          )
        ];
      case 3:
        return [
          CField(
            textController: textController[0],
          ),
          CField(
            textController: textController[1],
          ),
          CField(
            textController: textController[2],
          )
        ];
      case 4:
        return [
          CField(
            textController: textController[0],
          ),
          CField(
            textController: textController[1],
          ),
          CField(
            textController: textController[2],
          ),
          CField(
            textController: textController[3],
          ),
        ];
      case 5:
        return [
          CField(
            textController: textController[0],
          ),
          CField(
            textController: textController[1],
          ),
          CField(
            textController: textController[2],
          ),
          CField(
            textController: textController[3],
          ),
          CField(
            textController: textController[4],
          ),
        ];
    }

    return [
      CField(
        textController: textController[0],
      )
    ];
  }
}
