import 'package:flutter/material.dart';

import 'widgets/ball_container_widget.dart';

class PipesDrawer {
  static const pipeThickness = 2.0;

  static RRect horizontalPipe(Size size) {
    final width = size.width;
    final height = size.height;
    const ballSize = BallContainerWidget.size * 2;
    return RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: Offset(width / 2, height / 2),
          width: width,
          height: ballSize + pipeThickness * 2),
      const Radius.circular(0),
    );
  }

  static RRect verticalPipe(Size size) {
    final width = size.width;
    final height = size.height;
    const ballSize = BallContainerWidget.size * 2;
    return RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: Offset(width / 2, height / 2),
          width: ballSize + pipeThickness * 2,
          height: height),
      const Radius.circular(0),
    );
  }
}
