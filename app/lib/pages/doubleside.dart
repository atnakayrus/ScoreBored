import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Reading and Writing Files',
      home: FlutterDemo(),
    ),
  );
}

class FlutterDemo extends StatefulWidget {
  const FlutterDemo({super.key});

  @override
  _FlutterDemoState createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  int _counter = 0;
  int a = 0, b = 0;

  void increasea() {
    setState(() {
      a++;
    });
  }

  void increaseb() {
    setState(() {
      b++;
    });
  }

  void reset() {
    setState(() {
      a = 0;
      b = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading and Writing Files'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // Text(
              //   'Button tapped $_counter time${_counter == 1 ? '' : 's'}.',
              // ),
              // TextButton(onPressed: _decrementCounter, child: Text('Reduce')),
              Expanded(
                  child: GestureDetector(
                    onTap: increasea,
                    child: Container(
                      width: double.infinity,
                      color: Colors.red,
                      child: Center(
                          child: Text(
                        '$a',
                        style: TextStyle(fontSize: 30),
                      )),
                    ),
                  ),
                  flex: 5 + a),
              Expanded(
                child: GestureDetector(
                  onTap: increaseb,
                  child: Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: Center(
                        child: Text(
                      '$b',
                      style: TextStyle(fontSize: 30),
                    )),
                  ),
                ),
                flex: 5 + b,
              ),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: reset,
        tooltip: 'Increment',
        backgroundColor: Colors.red,
        child: const Icon(Icons.reset_tv),
      ),
    );
  }
}
