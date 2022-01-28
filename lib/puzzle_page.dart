import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'widgets/ball_animated_widget.dart';
import 'widgets/box_animated_widget.dart';

class PuzzlePage extends StatelessWidget {
  const PuzzlePage({Key? key}) : super(key: key);

  static const padding = 8.0;
  static const internalGap = 2.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (!kIsWeb) {
      if (size.width > size.height) {
        final diff = size.width - size.height;
        final width = size.height + diff / 4;
        size = Size(width, size.height);
        return Scaffold(
          body: Center(
              child: SizedBox(
                  width: width,
                  height: size.height,
                  child: _PuzzleView(size: size))),
        );
      } else {
        final diff = size.height - size.width;
        final height = size.width + diff / 4;
        size = Size(size.width, height);
        return Scaffold(
          body: Center(
              child: SizedBox(
                  width: size.width,
                  height: height,
                  child: _PuzzleView(size: size))),
        );
      }
    } else {
      return Scaffold(body: _PuzzleView(size: size));
    }
  }
}

class _PuzzleView extends StatelessWidget {
  const _PuzzleView({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PuzzlePage.padding),
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
    );
  }
}
