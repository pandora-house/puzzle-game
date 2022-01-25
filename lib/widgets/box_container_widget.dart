import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../engine.dart';
import '../pipes_drawer.dart';
import '../puzzle_page.dart';
import 'ball_container_widget.dart';

class BoxContainerWidget extends StatelessWidget {
  const BoxContainerWidget({Key? key, required this.id, required this.size})
      : super(key: key);
  final int id;
  final Size size;

  static const borderWidth = 3.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PuzzlePage.internalGap),
      child: SizedBox(
        width: Engine().getBoxWith(size) - 2 * PuzzlePage.internalGap,
        height: Engine().getBoxHeight(size) - 2 * PuzzlePage.internalGap,
        child: CustomPaint(
          painter: _BoxPainter(id: id),
          child: _BallView(
            id: id,
          ),
        ),
      ),
    );
  }
}

class _BallView extends StatelessWidget {
  const _BallView({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    final notCorrect = context.select<Engine, bool>((value) => !value.correct);
    return id == 1 && notCorrect
        ? const Center(child: BallContainerWidget())
        : const SizedBox.shrink();
  }
}

class _BoxPainter extends CustomPainter {
  const _BoxPainter({this.id});

  final int? id;

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    const double radius = 6;

    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = BoxContainerWidget.borderWidth;

    final borderRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: Offset(width / 2, height / 2), width: width, height: height),
      const Radius.circular(radius),
    );

    Color innerMainColor = const Color(0xFF7D84BD);
    Color innerSmallColor = const Color(0xFF949AFC);

    if (id == 1) {
      innerSmallColor = const Color(0xFFD868F5);
      innerMainColor = const Color(0xFFC628B6);
    }
    if (id == 15) {
      innerSmallColor = const Color(0xFFFAFFF2);
      innerMainColor = const Color(0xFFD6E623);
    }

    final innerPaintSmall = Paint()
      ..color = innerSmallColor
      ..style = PaintingStyle.fill
      ..strokeWidth = BoxContainerWidget.borderWidth;

    final innerRectSmall = RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: Offset(width / 2, 7),
          width: width - BoxContainerWidget.borderWidth * 2 + 4,
          height: 12),
      const Radius.circular(6),
    );

    final innerPaintMain = Paint()
      ..color = innerMainColor
      ..style = PaintingStyle.fill
      ..strokeWidth = BoxContainerWidget.borderWidth;

    final innerRectMain = RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: Offset(width / 2, height / 2 + 1),
          width: width - BoxContainerWidget.borderWidth * 2 + 4,
          height: height - BoxContainerWidget.borderWidth * 2 + 2),
      const Radius.circular(radius),
    );

    canvas.drawRRect(borderRect, borderPaint);
    canvas.drawRRect(innerRectSmall, innerPaintSmall);
    canvas.drawRRect(innerRectMain, innerPaintMain);

    if (id == 1) {
      PipesDrawer.start(canvas, size);
    } else if (id == 5) {
      PipesDrawer.vertical(canvas, size);
    } else if (id == 8) {
      PipesDrawer.topRightCorner(canvas, size);
    } else if (id == 9) {
      PipesDrawer.leftBottomCorner(canvas, size);
    } else if (id == 13) {
      PipesDrawer.topRightCorner(canvas, size);
    } else if (id == 14) {
      PipesDrawer.horizontal(canvas, size);
    } else if (id == 15) {
      PipesDrawer.end(canvas, size);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
