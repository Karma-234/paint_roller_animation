import 'dart:async';

import 'package:flutter/material.dart';
import 'package:paint_roller_animation/wall_painter.dart';

import 'paint_scroller_painter.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    if (mounted) {
      Timer.periodic(const Duration(seconds: 1), (_) {
        setState(() {
          isScrolling = !isScrolling;
        });
      });
    }
  }

  bool isScrolling = false;
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
                      width: MediaQuery.sizeOf(context).width * 0.5,
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.identity()
                    ..translate(
                        MediaQuery.sizeOf(context).width * 0.1,
                        isScrolling
                            ? MediaQuery.sizeOf(context).height * 0.05
                            : MediaQuery.sizeOf(context).height * 0.2),
                  child: CustomPaint(
                    painter: PaintScrollerPainter(isScrolled: isScrolling),
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
