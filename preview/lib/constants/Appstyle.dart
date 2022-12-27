import 'package:flutter/material.dart';

class AppStyle {
  static Color accentColor = const Color(0xFF2C3333);
  static Color mainColor = const Color(0xFF395B64);
  static Color bgColor = const Color(0xFFA5C9CA);
  static Color bgCardColor = const Color(0xFFE7F6F2);

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
  static TextStyle buttonText = const TextStyle(
    color: Color(0xFFA5C9CA),
  );
}
