import 'dart:ui';

import 'package:flutter/material.dart';

class PaintScrollerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    Path handlePath = Path();
    Paint rollerPaint = Paint()
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..color = Colors.green
      ..style = PaintingStyle.fill;
// Draw Paint Head
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromPoints(
                Offset(width * 0.1, 0), Offset(width * 0.7, height * 0.2)),
            const Radius.circular(8)),
        rollerPaint);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromPoints(Offset(width * 0.125, height * 0.02),
                Offset(width * 0.4, height * 0.06)),
            const Radius.circular(8)),
        rollerPaint..color = Colors.green.shade50);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromPoints(
                Offset(width * 0.1, 0), Offset(width * 0.7, height * 0.2)),
            const Radius.circular(8)),
        rollerPaint
          ..color = Colors.black
          ..style = PaintingStyle.stroke);
    // End Draw Paint Head
    handlePath.moveTo(width * 0.7, height * 0.10);
    handlePath.lineTo(width * 0.8, height * 0.10);
    handlePath.lineTo(width * 0.8, height * 0.30);
    handlePath.lineTo(width * 0.4, height * 0.30);
    handlePath.lineTo(width * 0.4, height * 0.50);
    //Draw Handle Inner paint
    Path dividerPath = Path();
    Paint handlePainter = Paint()
      ..color = Colors.grey
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;
    dividerPath.moveTo(width * 0.35, height * 0.495);
    dividerPath.lineTo(width * 0.455, height * 0.495);
    dividerPath.lineTo(width * 0.457, height * 0.570);
    dividerPath.lineTo(width * 0.345, height * 0.570);
    canvas.drawPath(dividerPath, handlePainter);
    dividerPath.moveTo(width * 0.365, height * 0.51);
    dividerPath.lineTo(width * 0.365, height * 0.54);
    canvas.drawPath(
        dividerPath,
        handlePainter
          ..color = Colors.grey.shade50
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5.0);
    dividerPath.close();
    // End of top divider
    // Bottom Divider Painter

    //Start of first color layer
    Path bottomColorPath = Path();
    Paint bottomColorPainter = Paint()..color = Colors.purple.shade400;
    bottomColorPath.moveTo(width * 0.33, height * 0.70);
    bottomColorPath.arcToPoint(Offset(width * 0.47, height * 0.70),
        radius: Radius.elliptical(width * 0.33, height), clockwise: false);

    bottomColorPath.close();
    canvas.drawPath(bottomColorPath, bottomColorPainter);
    //Start of second color layer
    Path bottomDividerPath = Path();
    Paint bottomHandlePainter = Paint()..color = Colors.purple.shade800;
    bottomDividerPath.moveTo(width * 0.345, height * 0.56);
    bottomDividerPath.lineTo(width * 0.455, height * 0.56);
    bottomDividerPath.lineTo(width * 0.47, height * 0.70);
    bottomDividerPath.lineTo(width * 0.33, height * 0.70);
    bottomDividerPath.moveTo(width * 0.33, height * 0.70);
    bottomDividerPath.quadraticBezierTo(
        width * 0.40, height * 0.72, width * 0.47, height * 0.70);
    bottomDividerPath.close();
    canvas.drawPath(bottomDividerPath, bottomHandlePainter);
    //End of second color layer
    // Draw handle depth
    Path depthPath = Path();
    Paint depthPainter = Paint()
      ..color = Colors.black
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    depthPath.moveTo(width * 0.43, height * 0.590);
    depthPath.lineTo(width * 0.43, height * 0.64);
    canvas.drawPath(depthPath, depthPainter);
    canvas.drawPoints(
        PointMode.points, [Offset(width * 0.43, height * 0.68)], depthPainter);
    //End  Draw handle depth

    //Start Draw Handle
    handlePath.moveTo(width * 0.35, height * 0.50);
    handlePath.lineTo(width * 0.45, height * 0.50);
    //Start Draw Handle sides
    handlePath.lineTo(width * 0.47, height * 0.70);
    handlePath.moveTo(width * 0.35, height * 0.50);
    handlePath.lineTo(width * 0.33, height * 0.70);
    //Start draw top path dvider
    handlePath.moveTo(width * 0.35, height * 0.50);
    handlePath.lineTo(width * 0.45, height * 0.50);
    handlePath.lineTo(width * 0.455, height * 0.56);
    handlePath.lineTo(width * 0.345, height * 0.56);
    //Start Draw Handle bottom arc
    handlePath.moveTo(width * 0.33, height * 0.70);
    handlePath.quadraticBezierTo(
        width * 0.40, height * 0.74, width * 0.47, height * 0.70);
    canvas.drawPath(handlePath, rollerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
