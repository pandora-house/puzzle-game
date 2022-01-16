import 'package:flutter/material.dart';

import '../engine.dart';

class BoxContainerWidget extends StatelessWidget {
  const BoxContainerWidget({Key? key, required this.id, required this.size})
      : super(key: key);
  final int id;
  final Size size;

  @override
  Widget build(BuildContext context) {
    const padding = 2.0;
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: SizedBox(
        width: Engine().getBoxWith(size) - 2 * padding,
        height: Engine().getBoxHeight(size) - 2 * padding,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(7),
        //   color: Colors.grey,
        // ),
        // child: Center(child: Text('$id')),
        child: CustomPaint(
          painter: MyPainter(),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
    double radius = 6;

    Paint blackPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    Paint redPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    RRect fullRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: Offset(width / 2, height / 2), width: width, height: height),
      Radius.circular(radius),
    );

    Path topRightArc = Path()
      ..moveTo(width - radius, 0)
      ..arcToPoint(Offset(width, radius), radius: Radius.circular(radius));

    Path bottomLeftArc = Path()
      ..moveTo(radius, height)
      ..arcToPoint(Offset(0, height - radius), radius: Radius.circular(radius));

    canvas.drawRRect(fullRect, blackPaint);
    canvas.drawPath(topRightArc, redPaint);
    canvas.drawPath(bottomLeftArc, redPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
