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
  double _positionX = 0;
  double _positionY = 0;
  double _boxHeight = 0;
  double _boxWith = 0;
  int _incrementY = 0;
  int _incrementX = 0;
  PositionGap? _gap;

  @override
  Widget build(BuildContext context) {
    final position = Engine().initPosition(widget.id, widget.size);
    _positionX = position.x;
    _positionY = position.y;
    _boxHeight = Engine().getBoxHeight(widget.size);
    _boxWith = Engine().getBoxWith(widget.size);
    final matrix = context.watch<Engine>().idMatrix;
    _gap = Engine().getGapPosition(widget.id, matrix);
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      top: _positionY + _boxHeight * _incrementY,
      left: _positionX + _boxWith * _incrementX,
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
                    _incrementY--;
                  });
                } else if (_gap == PositionGap.bottom) {
                  context
                      .read<Engine>()
                      .updateMatrix(widget.id, MoveBox.bottom);
                  setState(() {
                    _incrementY++;
                  });
                } else if (_gap == PositionGap.right) {
                  context.read<Engine>().updateMatrix(widget.id, MoveBox.right);
                  setState(() {
                    _incrementX++;
                  });
                } else if (_gap == PositionGap.left) {
                  context.read<Engine>().updateMatrix(widget.id, MoveBox.left);
                  setState(() {
                    _incrementX--;
                  });
                }

                context.read<Engine>().checkIdMatrix();
              },
      ),
    );
  }
}
