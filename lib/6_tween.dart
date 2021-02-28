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
          child: Example(),
        ),
      ),
    );
  }
}

class Example extends StatefulWidget {
  Example({Key key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  //Tween<double> widthTween = Tween(begin: 0, end: 300);
  Animatable<double> curveTween = Tween<double>(begin: 0, end: 300)
      .chain(CurveTween(curve: Curves.bounceOut));

  ColorTween colorTween = ColorTween(begin: Colors.red, end: Colors.green);
  int counter = 0;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _controller.addListener(() {
      counter++;
      // print('progress: ${_controller.value}');
      // print('duration: ${_controller.lastElapsedDuration}');
      // print('counter: ${counter}');

      _updateState();
    });

    //_controller.addStatusListener((AnimationStatus status) {
    //  print('current status is: $status');
    //  if (status == AnimationStatus.completed) {
    //    _controller.reverse();
    //  } else if (status == AnimationStatus.dismissed) {
    //    _controller.forward();
    //  }
    //});

    _controller.forward();

    super.initState();
  }

  _updateState() {
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: curveTween.evaluate(_controller),
              height: 300,
              color: colorTween.evaluate(_controller),
            ),
          ],
        ),
      ],
    );
  }
}
