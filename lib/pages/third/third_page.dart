import 'package:flutter/material.dart';
import 'package:flutter_beginner/pages/second/second_page.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ThirdPage extends HookWidget {
  ThirdPage({super.key});
  late Animation<double> _animation;
  @override
  Widget build(BuildContext context) {
    final controller =
        useAnimationController(duration: const Duration(seconds: 1));
    _animation = Tween<double>(begin: .0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RepaintBoundary(
          child: MyCustomAnimation(
              myanimation: _animation,
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.status == AnimationStatus.completed
              ? controller.reverse()
              : controller.forward();
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
