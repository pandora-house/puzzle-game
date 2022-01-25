import 'package:flutter/material.dart';

import 'widgets/ball_container_widget.dart';
import 'widgets/box_container_widget.dart';

class PipesDrawer {
  static const thickness = 3.0;

  static Paint _color() => Paint()
    ..color = const Color(0xFF0E0D1E)
    ..style = PaintingStyle.fill
    ..strokeWidth = BoxContainerWidget.borderWidth;

  static void _ballCorner(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    canvas.drawCircle(Offset(width / 2, height / 2),
        BallContainerWidget.size + thickness, _color());
  }

  static RRect _rightHalfCorner(Size size) {
    final width = size.width;
    final height = size.height;
    const ballSize = BallContainerWidget.size * 2;
    return RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: Offset(width / 2 + width / 4, height / 2),
          width: width / 2,
          height: ballSize + thickness * 2),
      const Radius.circular(0),
    );
  }

  static RRect _topHalfCorner(Size size) {
    final width = size.width;
    final height = size.height;
    const ballSize = BallContainerWidget.size * 2;
    return RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: Offset(width / 2, height / 4),
          width: ballSize + thickness * 2,
          height: height / 2),
      const Radius.circular(0),
    );
  }

  static RRect _bottomHalfCorner(Size size) {
    final width = size.width;
    final height = size.height;
    const ballSize = BallContainerWidget.size * 2;
    return RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: Offset(width / 2, height / 2 + height / 4),
          width: ballSize + thickness * 2,
          height: height / 2),
      const Radius.circular(0),
    );
  }

  static RRect _leftHalfCorner(Size size) {
    final width = size.width;
    final height = size.height;
    const ballSize = BallContainerWidget.size * 2;

    return RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: Offset(width / 4, height / 2),
          width: width / 2,
          height: ballSize + thickness * 2),
      const Radius.circular(0),
    );
  }

  static RRect _horizontal(Size size) {
    final width = size.width;
    final height = size.height;
    const ballSize = BallContainerWidget.size * 2;
    return RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: Offset(width / 2, height / 2),
          width: width,
          height: ballSize + thickness * 2),
      const Radius.circular(0),
    );
  }

  static RRect _vertical(Size size) {
    final width = size.width;
    final height = size.height;
    const ballSize = BallContainerWidget.size * 2;
    return RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: Offset(width / 2, height / 2),
          width: ballSize + thickness * 2,
          height: height),
      const Radius.circular(0),
    );
  }

  static void horizontal(Canvas canvas, Size size) {
    canvas.drawRRect(_horizontal(size), _color());
  }

  static void vertical(Canvas canvas, Size size) {
    canvas.drawRRect(_vertical(size), _color());
  }

  static void topRightCorner(Canvas canvas, Size size) {
    canvas.drawRRect(_topHalfCorner(size), _color());
    canvas.drawRRect(_rightHalfCorner(size), _color());
    _ballCorner(canvas, size);
  }

  static void leftBottomCorner(Canvas canvas, Size size) {
    canvas.drawRRect(_leftHalfCorner(size), _color());
    canvas.drawRRect(_bottomHalfCorner(size), _color());
    _ballCorner(canvas, size);
  }

  static void start(Canvas canvas, Size size) {
    canvas.drawRRect(_bottomHalfCorner(size), _color());
    _ballCorner(canvas, size);
  }

  static void end(Canvas canvas, Size size) {
    canvas.drawRRect(_leftHalfCorner(size), _color());
    _ballCorner(canvas, size);
  }
}
