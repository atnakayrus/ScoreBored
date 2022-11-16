import 'package:flutter/material.dart';
import 'package:preview/constants/Appstyle.dart';
import 'package:preview/widgets/tapCards.dart';

class TapIncrease extends StatefulWidget {
  const TapIncrease({super.key});

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
      body: Column(
        children: [
          Expanded(child: tapcard(() {}, 5)),
          Expanded(child: tapcard(() {}, 5)),
          Expanded(child: tapcard(() {}, 5)),
          Expanded(child: tapcard(() {}, 5)),
        ],
      ),
    );
  }
}
