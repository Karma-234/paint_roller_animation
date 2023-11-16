import 'dart:ui';

import 'package:flutter/material.dart';

class PaintScrollerPainter extends CustomPainter {
  final bool isScrolled;
  PaintScrollerPainter({this.isScrolled = false});
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
    depthPath.moveTo(width * 0.43, height * 0.585);
    depthPath.lineTo(width * 0.43, height * 0.67);
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

    Path knobPath = Path();
    Paint knobPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 5.0;
    knobPath.moveTo(width * 0.1, height * 0.08);

    knobPath.quadraticBezierTo(
        width * 0.05, height * 0.1, width * 0.1, height * 0.12);

    canvas.drawPath(knobPath, knobPaint);

    canvas.drawPath(
        knobPath,
        knobPaint
          ..color = Colors.black
          ..style = PaintingStyle.stroke);
    final leftXBound = width * 0.1;
    final rightXBound = width * 0.585;
    final rightXBound2 = width * 0.58;
    final bottomYBound = height * 0.125;
    final leftXBound2 = width * 0.13;
    final bottomYBound2 = height * 0.1075;
    const count = 10;
    final division = rightXBound / count;
    final division2 = rightXBound2 / count;

    Path linePath = Path();
    Paint linePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3.0;
    for (var i = 1; i <= count; i++) {
      if (isScrolled) {
        final iterativeMovement = division * (i - 0.2);
        final iterativeAngleMovement = division * (i - 0.795);
        linePath.moveTo(leftXBound + iterativeMovement, height * 0.14);
        linePath.lineTo(leftXBound + iterativeAngleMovement, height * 0.1985);
      } else {
        final iterativeMovement = division * i;
        final iterativeAngleMovement = division * (i - 1);
        linePath.moveTo(leftXBound + iterativeMovement, 0);
        linePath.lineTo(leftXBound + iterativeAngleMovement, bottomYBound);
      }
    }

    for (var i = 1; i < count; i++) {
      if (isScrolled) {
        final iterativeMovement = division * i;
        final iterativeAngleMovement = division * (i - 1);
        linePath.moveTo(leftXBound + iterativeMovement, 0);
        linePath.lineTo(leftXBound + iterativeAngleMovement, bottomYBound);
      } else {
        final iterativeMovement = division * (i - 0.2);
        final iterativeAngleMovement = division * (i - 0.795);
        linePath.moveTo(leftXBound + iterativeMovement, height * 0.14);
        linePath.lineTo(leftXBound + iterativeAngleMovement, height * 0.1985);
      }
    }
    for (var i = 1; i < count; i++) {
      if (isScrolled) {
        final iterativeMovement = division2 * (i + 0.1);
        final iterativeAngleMovement = division2 * (i - 0.795);
        linePath.moveTo(leftXBound2 + iterativeMovement, height * 0.12);
        if (i != count) {
          linePath.moveTo(leftXBound2 + iterativeMovement, height * 0.12);
        } else {
          linePath.moveTo(leftXBound2 + division2 * i - 3.9, height * 0.14);
        }
        linePath.lineTo(leftXBound2 + iterativeAngleMovement, height * 0.1985);
      } else {
        final iterativeMovement = division2 * i;
        final iterativeAngleMovement = division2 * (i - 0.9);
        linePath.moveTo(leftXBound2 + iterativeMovement, 0);
        if ((leftXBound2 + iterativeAngleMovement) < leftXBound2 - 0.9) {
          linePath.lineTo(leftXBound2 + iterativeAngleMovement, height * 0.059);
        } else {
          linePath.lineTo(leftXBound2 + iterativeAngleMovement, bottomYBound2);
        }
      }
    }
    for (var i = 1; i < count; i++) {
      if (isScrolled) {
        final iterativeMovement = division2 * (i + 0.1);
        final iterativeAngleMovement = division2 * (i - 0.795);
        linePath.moveTo(leftXBound2 + iterativeMovement, height * 0.12);
        if (i != count) {
          linePath.moveTo(leftXBound2 + iterativeMovement, height * 0.12);
        } else {
          linePath.moveTo(leftXBound2 + division2 * i - 3.9, height * 0.14);
        }
        linePath.lineTo(leftXBound2 + iterativeAngleMovement, height * 0.1985);
      } else {
        final iterativeMovement = division2 * i;
        final iterativeAngleMovement = division2 * (i - 0.9);
        linePath.moveTo(leftXBound2 + iterativeMovement, 0);
        if ((leftXBound2 + iterativeAngleMovement) < leftXBound2 - 0.9) {
          linePath.lineTo(leftXBound2 + iterativeAngleMovement, height * 0.059);
        } else {
          linePath.lineTo(leftXBound2 + iterativeAngleMovement, bottomYBound2);
        }
      }
    }
    canvas.drawPath(linePath, linePaint);
  }

  @override
  bool shouldRepaint(covariant PaintScrollerPainter oldDelegate) {
    return this.isScrolled != oldDelegate.isScrolled;
  }
}
