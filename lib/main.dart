import 'package:flutter/material.dart';

import 'paint_scroller_painter.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.all(8.0),
          child: CustomPaint(
            painter: PaintScrollerPainter(),
            child: const SizedBox(
              height: double.infinity,
              width: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}
