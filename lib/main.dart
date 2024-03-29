import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:preview/screens/homescreen.dart';

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox('Scores');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
