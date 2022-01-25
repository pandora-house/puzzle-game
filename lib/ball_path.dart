import 'dart:ui';

import 'package:flutter/material.dart';

import 'engine.dart';
import 'puzzle_page.dart';
import 'widgets/ball_container_widget.dart';
import 'widgets/box_container_widget.dart';

class BallPath {
  static Path drawPath(Size size) {
    const padding = PuzzlePage.padding;
    const internalGap = PuzzlePage.internalGap;
    final boxWith = Engine().getBoxWith(size);
    final boxHeight = Engine().getBoxHeight(size);
    const boxBorderWidth = BoxContainerWidget.borderWidth;
    const ballSize = BallContainerWidget.size;
    final quantityGaps = Engine().quantityInternalGaps();

    final initX = boxWith / 2 +
        padding / 2 -
        ballSize / 2 +
        internalGap * quantityGaps +
        boxBorderWidth / 2 - 1.5;

    final initY = boxHeight / 2 +
        padding / 2 -
        ballSize / 2 +
        internalGap * quantityGaps +
        boxBorderWidth / 2 - 1.5;

    final path = Path()
      ..moveTo(initX, initY)
      ..lineTo(initX, initY + boxHeight * 2)
      ..lineTo(initX + boxWith, initY + boxHeight * 2)
      ..lineTo(initX + boxWith, initY + boxHeight * 3)
      ..lineTo(initX + boxWith * 3, initY + boxHeight * 3);
    return path;
  }
}