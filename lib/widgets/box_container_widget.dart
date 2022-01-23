import 'package:flutter/material.dart';

import '../engine.dart';
import '../puzzle_page.dart';

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
        ),
      ),
    );
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

    Paint borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = BoxContainerWidget.borderWidth;

    RRect borderRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: Offset(width / 2, height / 2), width: width, height: height),
      const Radius.circular(radius),
    );

    Color innerMainColor = const Color(0xFFFFD096);
    Color innerSmallColor = const Color(0xFFFFE1C5);

    if (id == 1) {
      innerSmallColor = const Color(0xFFAFAFAF);
      innerMainColor = const Color(0xFF898685);
    }
    if (id == 15) {
      innerSmallColor = const Color(0xFFFF985C);
      innerMainColor = const Color(0xFFF56D23);
    }

    Paint innerPaintSmall = Paint()
      ..color = innerSmallColor
      ..style = PaintingStyle.fill
      ..strokeWidth = BoxContainerWidget.borderWidth;

    RRect innerRectSmall = RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: Offset(width / 2, 7),
          width: width - BoxContainerWidget.borderWidth * 2 + 4,
          height: 12),
      const Radius.circular(6),
    );

    Paint innerPaintMain = Paint()
      ..color = innerMainColor
      ..style = PaintingStyle.fill
      ..strokeWidth = BoxContainerWidget.borderWidth;

    RRect innerRectMain = RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: Offset(width / 2, height / 2 + 1),
          width: width - BoxContainerWidget.borderWidth * 2 + 4,
          height: height - BoxContainerWidget.borderWidth * 2 + 2),
      const Radius.circular(radius),
    );

    canvas.drawRRect(borderRect, borderPaint);
    canvas.drawRRect(innerRectSmall, innerPaintSmall);
    canvas.drawRRect(innerRectMain, innerPaintMain);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
