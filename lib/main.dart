import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

void main() {
  final myGame = Jogo();
  runApp(
    GameWidget(
      game: myGame,
    ),
  );
}

//https://flame-engine.org/docs/#/
class Jogo extends Game {
  static const int squareSpeed = 400;
  late Rect squarePos;
  int squareDirectionX = 1;
  int squareDirectionY = 1;

  @override
  Future<void> onLoad() async {
    squarePos = const Rect.fromLTWH(0, 0, 100, 100);
  }

  static final squarePaint = BasicPalette.white.paint();

  @override
  void update(double dt) {
    //put the logic in here
    squarePos = squarePos.translate(squareSpeed * squareDirectionX * dt,
        squareSpeed * squareDirectionY * dt);

    if (squareDirectionX == 1 && squarePos.right > size.x) {
      squareDirectionX = -1;
    } else if (squareDirectionX == -1 && squarePos.left < 0) {
      squareDirectionX = 1;
    }
    if (squareDirectionY == 1 && squarePos.bottom > size.y) {
      squareDirectionY = -1;
    } else if (squareDirectionY == -1 && squarePos.top < 0) {
      squareDirectionY = 1;
    }
  }

  @override
  void render(Canvas canvas) {
    //put graphics in here
    canvas.drawRect(squarePos, squarePaint);
  }
}
