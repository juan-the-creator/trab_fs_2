import 'package:flutter/material.dart';
import 'package:trab_fs_2/widgets/big_word.dart';
import 'package:trab_fs_2/widgets/c_app_bar_buttons.dart';
import 'package:trab_fs_2/widgets/c_button.dart';
import 'package:trab_fs_2/widgets/c_field.dart';
import 'package:trab_fs_2/widgets/c_overlay.dart';
import 'package:collection/collection.dart';
import 'dart:math';
import 'package:trab_fs_2/widgets/c_small_btn.dart';
import 'help_screen.dart';

class GameHard extends StatefulWidget {
  const GameHard({Key? key}) : super(key: key);

  @override
  _GameStateHard createState() => _GameStateHard();
}

class _GameStateHard extends State<GameHard> {
  //disgusting
  List<TextEditingController> textController =
      List.generate(4, (i) => TextEditingController());

  Function eq = const ListEquality().equals;

  late var word = loadWord();
  var lastN;
  var result = 0;
  var size = 4;
  List<Widget> fields = [];

  _GameStateHard() {
    fields = buildFieldList(size);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CAppBarButtons("VOLTAR PARA O ÍNICIO", home, "AJUDA (?)", help),
        body: Column(
          children: [
            SizedBox(height: 75),
            BigWord(
              word: word['palavra'].toString().toUpperCase(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: fields,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CSmallButton(
                  btnText: "-",
                  callback: removeField,
                ),
                CSmallButton(
                  btnText: "+",
                  callback: addField,
                )
              ],
            ),
            SizedBox(height: 75),
            CButton(
              btnText: "Verificar!",
              callback: () {
                FocusScope.of(context).unfocus();
                return verifySyllables();
              },
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
    fields = buildFieldList(4);
    for (TextEditingController controller in textController) {
      controller.text = '';
    }
  }

  void verifySyllables() {
    var input = getInput();
    if (eq(word['silabas'], input) && word['numSilabas'] == fields.length) {
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

  void addField() {
    if (size < 4) size += 1;
    setState(() {
      fields = buildFieldList(size);
      for (int i = size; i < 4; i++) {
        textController[i].text = '';
      }
    });
  }

  void removeField() {
    if (size > 2) size -= 1;
    setState(() {
      fields = buildFieldList(size);
      for (int i = size; i < 4; i++) {
        textController[i].text = '';
      }
    });
  }

  void home() {
    Navigator.pop(context);
    Navigator.pop(context);
  }

  void help() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HelpScreen()),
    );
  }

  List<Widget> buildFieldList(size) {
    List<Widget> widgetArray = [];

    for (int i = 0; i < size; i++) {
      widgetArray.add(CField(
        textController: textController[i],
      ));
    }

    return widgetArray;
  }

  Map loadWord() {
    var words = [
      {
        "palavra": "abacate",
        "numSilabas": 4,
        "silabas": ["a", "ba", "ca", "te"]
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
        "palavra": "friíssimo",
        "numSilabas": 4,
        "silabas": ["fri", "ís", "si", "mo"]
      },
      {
        "palavra": "cafeeira",
        "numSilabas": 4,
        "silabas": ["ca", "fe", "ei", "ra"]
      },
      {
        "palavra": "televisão",
        "numSilabas": 4,
        "silabas": ["te", "le", "vi", "são"]
      },
      {
        "palavra": "borboleta",
        "numSilabas": 4,
        "silabas": ["bor", "bo", "le", "ta"]
      },
      {
        "palavra": "política",
        "numSilabas": 4,
        "silabas": ["po", "lí", "ti", "ca"]
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
}
