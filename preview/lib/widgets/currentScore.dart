import 'package:flutter/material.dart';
import 'package:preview/Functions/datafunctions.dart';
import 'package:preview/constants/Appstyle.dart';

class CurrentScore extends StatelessWidget {
  final List data;
  const CurrentScore({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    HiveFunctions fun = HiveFunctions();
    String name = data[0];
    return AlertDialog(
      backgroundColor: AppStyle.bgCardColor,
      title: Text('$name \'s Score History'),
      content: Text(
        fun.scoreHistory(data[2]),
        softWrap: true,
      ),
    );
  }
}
