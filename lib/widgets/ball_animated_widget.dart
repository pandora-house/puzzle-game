import 'package:flutter/material.dart';
import 'ball_container_widget.dart';

class BallAnimatedWidget extends StatelessWidget {
  const BallAnimatedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(top: 100, left: 100, child: BallContainerWidget());
  }
}
