import 'package:flutter/material.dart';

class AppStyle {
  static Color accentColor = const Color(0xFF5D5393);
  static Color mainColor = const Color(0xFF231858);
  static Color bgColor = const Color(0xFF867DB0);
  static Color bgCardColor = const Color(0xFFA6A0C1);

  static TextStyle mainTitle = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  static TextStyle mainContent = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );
  static List<BoxShadow> borderShadow = const [
    BoxShadow(
      color: Colors.black45,
      offset: Offset(
        5.0,
        5.0,
      ),
      blurRadius: 8.0,
      spreadRadius: 2.0,
    ), //BoxShadow
    BoxShadow(
      color: Colors.white,
      offset: Offset(0.0, 0.0),
      blurRadius: 0.0,
      spreadRadius: 0.0,
    ), //BoxShadow
  ];
}
