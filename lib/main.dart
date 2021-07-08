import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'components/letter.dart';

void main() {
  final myGame = Jogo();
  runApp(
    GameWidget(
      game: myGame,
    ),
  );
}

//https://flame-engine.org/docs/#/
class Jogo extends BaseGame with HasDraggableComponents {
  final double zoom = 1;
  bool debugMode = true;
  @override
  Future<void> onLoad() async {
    camera.zoom = zoom;
    add(Letter());
    add(Letter()..y = 350);
  }
}
