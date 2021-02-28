import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ImplicitAnimationDemo(),
        ),
      ),
    );
  }
}

class ImplicitAnimationDemo extends StatefulWidget {
  ImplicitAnimationDemo({Key key}) : super(key: key);

  @override
  _ImplicitAnimationDemoState createState() => _ImplicitAnimationDemoState();
}

class _ImplicitAnimationDemoState extends State<ImplicitAnimationDemo> {
  static const double _startWidth = 100.0;
  static const double _startHeight = 100.0;
  static const Color _startColor = Colors.red;

  double width = _startWidth;
  double height = _startHeight;
  Color color = _startColor;

  void _animateContianer() {
    setState(() {
      width = (width == _startWidth) ? _startWidth * 2 : _startWidth;
      height = (height == _startHeight) ? _startHeight * 2 : _startHeight;
      color = (color == _startColor) ? Colors.blue : _startColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _animateContianer,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        width: width,
        height: height,
        color: color,
      ),
    );
  }
}
