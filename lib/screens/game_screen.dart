import 'package:flutter/material.dart';
import 'package:trab_fs_2/widgets/big_word.dart';
import 'package:trab_fs_2/widgets/c_app_bar_buttons.dart';
import 'package:trab_fs_2/widgets/c_button.dart';
import 'package:trab_fs_2/widgets/c_field.dart';
import 'package:trab_fs_2/widgets/c_overlay.dart';
import 'package:collection/collection.dart';

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
  //todo:
  //var word = loadWord();
  var word = {
    "palavra": "ayaya",
    "numSilabas": 3,
    "silabas": ["a", "ya", "ya"]
  };
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

  void verifySyllables() {
    word;
    var syllables = getInput();

    if (eq(word['silabas'], syllables)) {
      setState(() {
        result = 1;
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
      if (controller.text != '') input.add(controller.text);
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
            textController: textController[2],
          ),
          CField(
            textController: textController[1],
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
