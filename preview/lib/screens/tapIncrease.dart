import 'package:flutter/material.dart';
import 'package:preview/constants/Appstyle.dart';
import 'package:preview/widgets/tapCards.dart';

class TapIncrease extends StatefulWidget {
  List data;
  TapIncrease({super.key, required this.data});

  @override
  State<TapIncrease> createState() => _TapIncreaseState();
}

class _TapIncreaseState extends State<TapIncrease> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.mainColor,
      ),
      backgroundColor: AppStyle.bgColor,
      body: ListView.builder(
        itemBuilder: (context, index) {
          return tapcard(() {}, widget.data[index]);
        },
        itemCount: widget.data.length,
      ),
    );
  }
}
