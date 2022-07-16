import 'dart:ui';

import 'package:flutter/material.dart';

class start extends StatefulWidget {
  const start({Key? key}) : super(key: key);

  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text('Scoreboards available')),
      body: Row(children: [
        Container(
          child: Text('Hello'),
          color: Colors.red,
          padding: EdgeInsets.all(20),
        )
      ]),
    ));
  }
}
