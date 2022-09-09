import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PreviusPage extends StatefulWidget {
  const PreviusPage({Key? key}) : super(key: key);

  @override
  State<PreviusPage> createState() => _PreviusPageState();
}

class _PreviusPageState extends State<PreviusPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _maxSlide = 1.0;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx > 0) {
            _maxSlide = 1.0;
          }
          if (kDebugMode) {
            print(_maxSlide);
            print('------------------${_controller.value}');
          }
          setState(() {});
        },
        child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return Container(
                color: Colors.blue,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Transform.translate(
                  offset: Offset(_maxSlide * (_controller.value - 1), 0),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..rotateY(
                        pi / 2 * (1 - _controller.value),
                      ),
                    alignment: Alignment.centerRight,
                    child: Drawer(
                      width: MediaQuery.of(context).size.width - 100,
                      child: const Center(
                        child: Text('Hello world'),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
