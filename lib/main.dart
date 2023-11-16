import 'package:flutter/material.dart';
import 'package:paint_roller_animation/wall_painter.dart';

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
          child: Center(
            child: Stack(
              children: [
                Align(
                  alignment: const Alignment(0.0, -1),
                  child: CustomPaint(
                    painter: WallPainter(),
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.2,
                      width: MediaQuery.sizeOf(context).width * 0.6,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0.0, -1),
                  child: CustomPaint(
                    painter: PaintScrollerPainter(),
                    child: const SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
