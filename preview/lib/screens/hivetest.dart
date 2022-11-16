import 'package:flutter/material.dart';

class HiveTest extends StatefulWidget {
  const HiveTest({super.key});

  @override
  State<HiveTest> createState() => _HiveTestState();
}

class _HiveTestState extends State<HiveTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Test'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Write')),
            ElevatedButton(onPressed: () {}, child: const Text('Read')),
            ElevatedButton(onPressed: () {}, child: const Text('Delete')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
