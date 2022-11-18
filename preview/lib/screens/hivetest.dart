import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveTest extends StatefulWidget {
  const HiveTest({super.key});

  @override
  State<HiveTest> createState() => _HiveTestState();
}

class _HiveTestState extends State<HiveTest> {
  final _myBox = Hive.box('mybox');
  void ReadData() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
            content:
                Text((_myBox.get(1) != null ? _myBox.get(1) : 'not found'))));
  }

  void WriteData() {
    _myBox.put(1, 'surya');
    print(_myBox.get(1));
  }

  void DeleteData() {
    _myBox.delete(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Test'),
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
                onPressed: ReadData,
                child: const Text('Read'),
                color: Colors.lightBlueAccent),
            MaterialButton(
              onPressed: DeleteData,
              child: const Text('Delete'),
              color: Colors.red,
            ),
            MaterialButton(
                onPressed: WriteData,
                child: const Text('Write'),
                color: Colors.green),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
