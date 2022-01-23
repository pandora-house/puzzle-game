import 'package:flutter/material.dart';

class BallContainerWidget extends StatelessWidget {
  const BallContainerWidget({Key? key}) : super(key: key);
  static const size = 24.0;

  @override
  Widget build(BuildContext context) {
    return const CustomPaint(
      painter: _BallPainter(),
    );
  }
}

class _BallPainter extends CustomPainter {
  const _BallPainter();

  @override
  void paint(Canvas canvas, Size size) {
    const double strokeBorderWidth = 0.5;

    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final smallPaint = Paint()
      ..color = const Color(0xFFEEEEEE)
      ..style = PaintingStyle.fill;

    final mediumPaint = Paint()
      ..color = const Color(0xFFE3E3E3)
      ..style = PaintingStyle.fill;

    final largePaint = Paint()
      ..color = const Color(0xFFA8A8A8)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
        const Offset(0, 0), BallContainerWidget.size, borderPaint);
    canvas.drawCircle(const Offset(0, 0),
        BallContainerWidget.size - 2 * strokeBorderWidth, largePaint);
    canvas.drawCircle(
        const Offset(0, -1), BallContainerWidget.size * 6 / 7, mediumPaint);
    canvas.drawCircle(
        const Offset(0, -5), BallContainerWidget.size * 1 / 2, smallPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
