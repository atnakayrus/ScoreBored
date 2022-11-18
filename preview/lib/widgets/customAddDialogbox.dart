import 'package:flutter/material.dart';
import 'package:preview/Functions/datafunctions.dart';
import 'package:preview/constants/AppStyle.dart';

class AddDialog extends StatefulWidget {
  Function addEle;
  AddDialog({super.key, required this.addEle});

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  TextEditingController no_of_players = TextEditingController();
  double players = 1;
  HiveFunctions func = HiveFunctions();
  List<int> options = [1, 2, 3, 4, 5, 6, 7, 8];
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppStyle.bgCardColor,
      title: Center(
          child: Column(
        children: const [
          Text('Add Fields'),
          Divider(
            height: 10,
          ),
        ],
      )),
      content: Container(
        height: 100,
        child: Column(
          children: [
            const Text('Enter Number of Players'),
            Slider(
              min: 1,
              max: 8,
              value: players,
              divisions: 7,
              onChanged: (value) {
                setState(() {
                  players = value;
                });
              },
            ),
            Text(
              (players.toInt()).toString(),
              style: AppStyle.mainTitle,
            )
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: AppStyle.accentColor,
          child: Text('Cancel'),
        ),
        MaterialButton(
          onPressed: () {
            List li = func.newScoreBoards(players.toInt());
            widget.addEle(li);
            Navigator.of(context).pop();
          },
          color: AppStyle.accentColor,
          child: Text('Submit'),
        ),
      ],
    );
  }
}
