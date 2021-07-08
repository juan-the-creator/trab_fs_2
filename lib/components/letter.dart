import 'package:flame/geometry.dart';
import 'package:flutter/material.dart' hide Image, Draggable;
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:trab_fs_2/main.dart';

class Letter extends PositionComponent
    with Draggable, Hitbox, Collidable, HasGameRef<Jogo> {
  @override
  Letter({Vector2? position})
      : super(
          position: position ?? Vector2.all(100),
          size: Vector2.all(100),
          anchor: Anchor.center,
        ) {
    addShape(HitboxRectangle());
  }

  late Vector2 velocity;
  final _collisionColor = Colors.amber;
  final _defaultColor = Colors.cyan;
  bool _isWallHit = false;
  bool _isCollision = false;

  Vector2? dragDeltaPosition;
  bool get isDragging => dragDeltaPosition != null;

  @override
  Future<void> onLoad() async {
    final center = gameRef.size / 2;
    velocity = (center - position)..scaleTo(150);
  }

  @override
  void update(double dt) {
    super.update(dt);
    debugColor = _isCollision ? _collisionColor : _defaultColor;
    _isCollision = false;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    renderShapes(canvas);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    if (other is ScreenCollidable) {
      _isWallHit = true;
      return;
    }
    _isCollision = true;
  }

  @override
  bool onDragStart(int pointerId, DragStartInfo info) {
    dragDeltaPosition = info.eventPosition.game - position;
    return false;
  }

  @override
  bool onDragUpdate(int pointerId, DragUpdateInfo info) {
    final dragDeltaPosition = this.dragDeltaPosition;
    if (dragDeltaPosition == null) {
      return false;
    }

    position.setFrom(info.eventPosition.game - dragDeltaPosition);
    return false;
  }

  @override
  bool onDragEnd(int pointerId, _) {
    dragDeltaPosition = null;
    return false;
  }

  @override
  bool onDragCancel(int pointerId) {
    dragDeltaPosition = null;
    return false;
  }
}
