import 'package:flutter/material.dart';

class CustomPageRouteBuilder extends PageRouteBuilder {
  final Widget child;
  CustomPageRouteBuilder({required this.child})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => child,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    ScaleTransition(
                      scale: animation,
                      child: child,
                    ));
}
