import 'package:flutter/material.dart';

import 'widgets/box_animated_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
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
          ],
        ));
  }
}