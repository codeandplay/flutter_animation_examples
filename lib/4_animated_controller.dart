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
  int counter = 0;
  double _width = 0;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _controller.addListener(() {
      counter++;
      print('progress: ${_controller.value}');
      print('duration: ${_controller.lastElapsedDuration}');
      print('counter: ${counter}');

      _setWidth(_controller.value * 300);
    });

    super.initState();
  }

  _setWidth(val) {
    setState(() {
      _width = val;
    });
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
              width: _width,
              height: 300,
              color: Colors.red,
            ),
          ],
        ),
        Row(
          children: [
            RaisedButton(
              child: Text('Repeat'),
              onPressed: () {
                _controller.repeat(reverse: true);
              },
            ),
            RaisedButton(
              child: Text('Reset and forward'),
              onPressed: () {
                counter = 0;
                _controller.reset();
                _controller.forward();
              },
            ),
            RaisedButton(
              child: Text('stop'),
              onPressed: () {
                _controller.stop();
              },
            ),
          ],
        ),
      ],
    );
  }
}
