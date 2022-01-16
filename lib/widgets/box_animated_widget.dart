import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../engine.dart';
import 'box_container_widget.dart';

class BoxAnimatedWidget extends StatefulWidget {
  const BoxAnimatedWidget({Key? key, required this.id, required this.size})
      : super(key: key);
  final int id;
  final Size size;

  @override
  State<BoxAnimatedWidget> createState() => _BoxAnimatedWidgetState();
}

class _BoxAnimatedWidgetState extends State<BoxAnimatedWidget> {
  double positionX = 0;
  double positionY = 0;
  double boxHeight = 0;
  double boxWith = 0;
  int incrementY = 0;
  int incrementX = 0;
  PositionGap? _gap;

  @override
  void initState() {
    super.initState();
    final position = Engine().initPosition(widget.id, widget.size);
    positionX = position.x;
    positionY = position.y;
    boxHeight = Engine().getBoxHeight(widget.size);
    boxWith = Engine().getBoxWith(widget.size);
  }

  @override
  Widget build(BuildContext context) {
    final matrix = context.watch<Engine>().idMatrix;
    _gap = Engine().getGapPosition(widget.id, matrix);
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 700),
      top: positionY + boxHeight * incrementY,
      left: positionX + boxWith * incrementX,
      child: GestureDetector(
        child: BoxContainerWidget(
          id: widget.id,
          size: widget.size,
        ),
        onTap: _gap == null
            ? null
            : () {
          if (_gap == PositionGap.top) {
            context.read<Engine>().updateMatrix(widget.id, MoveBox.top);
            setState(() {
              incrementY--;
            });
          } else if (_gap == PositionGap.bottom) {
            context
                .read<Engine>()
                .updateMatrix(widget.id, MoveBox.bottom);
            setState(() {
              incrementY++;
            });
          } else if (_gap == PositionGap.right) {
            context
                .read<Engine>()
                .updateMatrix(widget.id, MoveBox.right);
            setState(() {
              incrementX++;
            });
          } else if (_gap == PositionGap.left) {
            context.read<Engine>().updateMatrix(widget.id, MoveBox.left);
            setState(() {
              incrementX--;
            });
          }

          final isIdMatrixCorrect = context.read<Engine>().isIdMatrixCorrect();
        },
      ),
    );
  }
}