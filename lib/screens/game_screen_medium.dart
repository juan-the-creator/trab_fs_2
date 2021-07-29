import 'package:flutter/material.dart';
import 'package:trab_fs_2/widgets/big_word.dart';
import 'package:trab_fs_2/widgets/c_app_bar_buttons.dart';
import 'package:trab_fs_2/widgets/c_button.dart';
import 'package:trab_fs_2/widgets/c_field.dart';
import 'package:trab_fs_2/widgets/c_overlay.dart';
import 'package:collection/collection.dart';
import 'help_screen.dart';
import 'dart:math';

class GameMedium extends StatefulWidget {
  const GameMedium({Key? key}) : super(key: key);

  @override
  _GameStateMedium createState() => _GameStateMedium();
}

class _GameStateMedium extends State<GameMedium> {
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
        appBar: CAppBarButtons("VOLTAR PARA O ÍNICIO", home, "AJUDA (?)", help),
        body: Column(
          children: [
            SizedBox(height: 75),
            BigWord(
              word: word['palavra'].toString().toUpperCase(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: buildFieldList(word['numSilabas']),
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

    for (TextEditingController controller in textController) {
      controller.text = '';
    }
  }

  void verifySyllables() {
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
        "palavra": "uruguai",
        "numSilabas": 3,
        "silabas": ["u", "ru", "guai"]
      },
      {
        "palavra": "enxaguei",
        "numSilabas": 3,
        "silabas": ["en", "xa", "guei"]
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
        "palavra": "ideia",
        "numSilabas": 3,
        "silabas": ["i", "de", "ia"]
      },
      {
        "palavra": "animais",
        "numSilabas": 3,
        "silabas": ["a", "ni", "mais"]
      },
      {
        "palavra": "vassoura",
        "numSilabas": 3,
        "silabas": ["vas", "sou", "ra"]
      },
      {
        "palavra": "transportar",
        "numSilabas": 3,
        "silabas": ["trans", "por", "tar"]
      },
      {
        "palavra": "descida",
        "numSilabas": 3,
        "silabas": ["des", "ci", "da"]
      },
      {
        "palavra": "exceder",
        "numSilabas": 3,
        "silabas": ["ex", "ce", "der"]
      },
      {
        "palavra": "ruína",
        "numSilabas": 3,
        "silabas": ["ru", "í", "na"]
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
