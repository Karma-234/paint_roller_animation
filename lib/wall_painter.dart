import 'package:flutter/material.dart';

class WallPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    Path paintPath = Path();
    Paint paint = Paint()
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..color = Colors.green;
    paintPath.moveTo(0, height);
    paintPath.lineTo(0, height * 0.4);
    paintPath.quadraticBezierTo(
        width * 0.1, height * 0.2, width * 0.2, height * 0.4);
    paintPath.lineTo(width * 0.2, height * 0.7);
    paintPath.lineTo(width * 0.4, height * 0.7);
    paintPath.lineTo(width * 0.4, height * 0.2);
    paintPath.quadraticBezierTo(
        width * 0.5, height * 0.1, width * 0.6, height * 0.2);
    paintPath.lineTo(width * 0.6, height * 0.5);
    paintPath.lineTo(width * 0.8, height * 0.5);
    paintPath.lineTo(width * 0.8, height * 0.3);
    paintPath.quadraticBezierTo(
        width * 0.9, height * 0.15, width, height * 0.3);
    paintPath.lineTo(width, height);
    paintPath.close();
    canvas.drawPath(paintPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
