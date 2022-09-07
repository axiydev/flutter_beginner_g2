import 'dart:math';

import 'package:animations/animations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beginner/pages/detail/detail_page.dart';
import 'package:simple_animations/animation_mixin/animation_mixin.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with AnimationMixin {
  @override
  late AnimationController controller;
  Animation<double>? _animation;
  FractionalOffset? _fractionalOffset = FractionalOffset.topLeft;
  double? _opacity = .0;
  CrossFadeState? _crossFadeState = CrossFadeState.showFirst;
  EdgeInsets? _padding = const EdgeInsets.all(20);
  double? _currentPositionBottom = 30;
  final double _currentPixel = .0;
  @override
  void initState() {
    controller = createController(fps: 60);
    _animation = Tween<double>(begin: .0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.linear));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('animations'),
      ),
      body: StatefulBuilder(builder: (context, setState) {
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (kDebugMode) {
              print(notification.metrics.pixels);
              if (notification.metrics.pixels > _currentPixel) {
                _currentPositionBottom = -100;
              } else {
                _currentPositionBottom = 30;
              }
              if (notification.metrics.pixels ==
                  notification.metrics.maxScrollExtent) {
                if (kDebugMode) {
                  print("OXIRI");
                }
              }

              if (notification.metrics.pixels ==
                  notification.metrics.minScrollExtent) {
                if (kDebugMode) {
                  print("BEGIN");
                }
              }
              setState(() {});
            }
            return true;
          },
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Column(
                  children: [
                    //? AnimatedAlign or AnimatedContainer
                    InkWell(
                      onTap: () {
                        _fractionalOffset =
                            _fractionalOffset == FractionalOffset.topRight
                                ? FractionalOffset.topLeft
                                : FractionalOffset.topRight;
                        setState(() {});
                      },
                      child: SizedBox(
                        // height: MediaQuery.of(context).size.height * 0.3,
                        child: AnimatedContainer(
                          alignment: _fractionalOffset!,
                          duration: const Duration(seconds: 1),
                          curve: Curves.bounceOut,
                          child: Container(
                            height: 80,
                            width: 80,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    //? AnimatedOpacity
                    AnimatedOpacity(
                      opacity: _opacity!,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeIn,
                      child: const Text(
                        'animaions',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ),
                    //? AnimatedCrossFade
                    AnimatedCrossFade(
                        firstChild: myBox(Colors.blue),
                        secondChild: Container(
                            height: 100,
                            alignment: Alignment.center,
                            child: const Chip(label: Text('cross fade'))),
                        firstCurve: Curves.ease,
                        secondCurve: Curves.easeIn,
                        crossFadeState: _crossFadeState!,
                        reverseDuration: const Duration(seconds: 1),
                        duration: const Duration(seconds: 1)),
                    const SizedBox(
                      height: 10,
                    ),
                    PhysicalModel(
                      color: Colors.grey,
                      elevation: 10,
                      shape: BoxShape.rectangle,
                      shadowColor: Colors.grey,
                      child: Tooltip(
                        message: 'Animated Padding',
                        child: ColoredBox(
                          color: Colors.green,
                          child: AnimatedPadding(
                            padding: _padding!,
                            duration: const Duration(seconds: 1),
                            child: myBox(Colors.green),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MyCustomAnimation(
                        myanimation: _animation!, child: myBox(Colors.orange)),
                    const SizedBox(
                      height: 30,
                    ),
                    OpenContainer(
                        middleColor: Colors.green,
                        transitionDuration: const Duration(seconds: 1),
                        openShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        closedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        closedBuilder: (ctx, action) => const FlutterLogo(
                              size: 60,
                            ),
                        openBuilder: (ctx, action) => const DetailPage()),
                    const SizedBox(
                      height: 1000,
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 450),
                bottom: _currentPositionBottom,
                left: .0,
                right: .0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                        heroTag: 'animated opacity',
                        tooltip: 'animated opacity',
                        child: const Icon(Icons.play_arrow),
                        onPressed: () {
                          _opacity = _opacity == .0 ? 1 : .0;
                          setState(() {});
                        }),
                    const SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                        heroTag: 'animated cross fade',
                        tooltip: 'animated cross fade',
                        child: const Icon(Icons.play_arrow),
                        onPressed: () {
                          _crossFadeState =
                              _crossFadeState == CrossFadeState.showFirst
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst;
                          setState(() {});
                        }),
                    const SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                        heroTag: 'animated padding',
                        tooltip: 'animated padding',
                        child: const Icon(Icons.play_arrow),
                        onPressed: () {
                          _padding = _padding == const EdgeInsets.all(20)
                              ? const EdgeInsets.all(50)
                              : const EdgeInsets.all(20);
                          setState(() {});
                        }),
                    const SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                        heroTag: 'animated widget',
                        tooltip: 'animated widget',
                        child: const Icon(Icons.play_arrow),
                        onPressed: () {
                          controller.status == AnimationStatus.completed
                              ? controller.reverse()
                              : controller.forward();
                        }),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Row(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     FloatingActionButton(
      //         heroTag: 'animated opacity',
      //         tooltip: 'animated opacity',
      //         child: const Icon(Icons.play_arrow),
      //         onPressed: () {
      //           _opacity = _opacity == .0 ? 1 : .0;
      //           setState(() {});
      //         }),
      //     const SizedBox(
      //       width: 10,
      //     ),
      //     FloatingActionButton(
      //         heroTag: 'animated cross fade',
      //         tooltip: 'animated cross fade',
      //         child: const Icon(Icons.play_arrow),
      //         onPressed: () {
      //           _crossFadeState = _crossFadeState == CrossFadeState.showFirst
      //               ? CrossFadeState.showSecond
      //               : CrossFadeState.showFirst;
      //           setState(() {});
      //         }),
      //     const SizedBox(
      //       width: 10,
      //     ),
      //     FloatingActionButton(
      //         heroTag: 'animated padding',
      //         tooltip: 'animated padding',
      //         child: const Icon(Icons.play_arrow),
      //         onPressed: () {
      //           _padding = _padding == const EdgeInsets.all(20)
      //               ? const EdgeInsets.all(50)
      //               : const EdgeInsets.all(20);
      //           setState(() {});
      //         }),
      //   ],
      // ),
    );
  }

  Widget myBox(color) => Container(
        height: 100,
        width: 100,
        color: color as Color,
      );
}

class MyCustomAnimation extends AnimatedWidget {
  final Widget? child;
  final Animation<double> myanimation;
  const MyCustomAnimation(
      {Key? key, required this.myanimation, required this.child})
      : super(listenable: myanimation, key: key);
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: myanimation.value * 2 * pi,
      child: child,
    );
  }
}
