import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LastPage extends StatefulWidget {
  const LastPage({Key? key}) : super(key: key);

  @override
  State<LastPage> createState() => _LastPageState();
}

class _LastPageState extends State<LastPage>
    with SingleTickerProviderStateMixin {
  late AnimationController? _animationController;
  late Animation<double> _animationSize;
  late Animation<double> _size;
  late Animation<double> _animationRotate;
  late Animation<double> _borderRadius;
  late Animation<Color?> _colorAnimation;
//? initState
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationSize = Tween<double>(begin: 50, end: 200).animate(CurvedAnimation(
        parent: _animationController!,
        curve: const Interval(.0, .5, curve: Curves.ease)));
    _size = Tween<double>(begin: 30, end: 200).animate(CurvedAnimation(
        parent: _animationController!,
        curve: const Interval(.5, 1, curve: Curves.ease)));
    _animationRotate = Tween<double>(begin: .0, end: 4 * pi).animate(
        CurvedAnimation(
            parent: _animationController!,
            curve: const Interval(.0, 1, curve: Curves.ease)));
    _borderRadius = Tween<double>(begin: 30, end: 10).animate(CurvedAnimation(
        parent: _animationController!,
        curve: const Interval(.25, 1, curve: Curves.ease)));
    _colorAnimation =
        ColorTween(begin: Colors.blue[300], end: Colors.orange[400]).animate(
            CurvedAnimation(
                parent: _animationController!,
                curve: const Interval(.5, .75, curve: Curves.ease)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: GestureDetector(
        onTap: () async {
          if (_animationController!.status == AnimationStatus.completed) {
            await _animationController!.reverse().orCancel;
          } else {
            await _animationController!.forward().orCancel;
          }
        },
        child: Center(
          child: AnimatedBuilder(
            animation: _animationController!,
            builder: (context, child) {
              return SizedBox(
                height: _animationSize.value,
                width: _animationSize.value,
                child: Transform.rotate(
                  angle: _animationRotate.value,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: _size.value,
                      width: _size.value,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(_borderRadius.value),
                          color: _colorAnimation.value),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
