import 'dart:ui';

import 'package:flutter/material.dart';

import '../ball_path.dart';
import 'ball_container_widget.dart';

class BallAnimatedWidget extends StatefulWidget {
  const BallAnimatedWidget({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  State<BallAnimatedWidget> createState() => _BallAnimatedWidgetState();
}

class _BallAnimatedWidgetState extends State<BallAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _animation;
  late final Path _path;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 6));
    super.initState();
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        // todo change update ui
        setState(() {});
      });
    _controller.forward();
    _path = BallPath.drawPath(widget.size);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: calculate(_animation.value).dy,
        left: calculate(_animation.value).dx,
        child: const BallContainerWidget());
  }

  Offset calculate(value) {
    PathMetrics pathMetrics = _path.computeMetrics();
    PathMetric pathMetric = pathMetrics.elementAt(0);
    value = pathMetric.length * value;
    Tangent? pos = pathMetric.getTangentForOffset(value);
    return pos!.position;
  }
}
