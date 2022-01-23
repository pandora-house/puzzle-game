import 'package:flutter/material.dart';

import 'widgets/ball_animated_widget.dart';
import 'widgets/box_animated_widget.dart';

class PuzzlePage extends StatelessWidget {
  const PuzzlePage({Key? key}) : super(key: key);

  static const padding = 8.0;
  static const internalGap = 2.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(padding),
      child: Stack(
        children: [
          BoxAnimatedWidget(
            id: 1,
            size: size,
          ),
          BoxAnimatedWidget(
            id: 2,
            size: size,
          ),
          BoxAnimatedWidget(
            id: 3,
            size: size,
          ),
          BoxAnimatedWidget(
            id: 4,
            size: size,
          ),
          BoxAnimatedWidget(
            id: 5,
            size: size,
          ),
          BoxAnimatedWidget(
            id: 6,
            size: size,
          ),
          BoxAnimatedWidget(
            id: 7,
            size: size,
          ),
          BoxAnimatedWidget(
            id: 8,
            size: size,
          ),
          BoxAnimatedWidget(
            id: 9,
            size: size,
          ),
          BoxAnimatedWidget(
            id: 10,
            size: size,
          ),
          BoxAnimatedWidget(
            id: 11,
            size: size,
          ),
          BoxAnimatedWidget(
            id: 12,
            size: size,
          ),
          BoxAnimatedWidget(
            id: 13,
            size: size,
          ),
          BoxAnimatedWidget(
            id: 14,
            size: size,
          ),
          BoxAnimatedWidget(
            id: 15,
            size: size,
          ),
          BallAnimatedWidget(
            size: size,
          ),
        ],
      ),
    ));
  }
}