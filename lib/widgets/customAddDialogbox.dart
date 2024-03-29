import 'package:flutter/material.dart';
import 'package:preview/Functions/datafunctions.dart';
import 'package:preview/Functions/hivefn.dart';
import 'package:preview/constants/Appstyle.dart';

import 'PlayerDataDialog.dart';

class AddDialog extends StatefulWidget {
  final Function addEle;
  const AddDialog({super.key, required this.addEle});

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  DataBase db = DataBase();
  TextEditingController noOfPlayers = TextEditingController();
  double players = 1;
  HiveFunctions func = HiveFunctions();
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
      content: SizedBox(
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
                db.updateData();
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
          child: Text(
            'Cancel',
            style: AppStyle.buttonText,
          ),
        ),
        MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
            showDialog(
                context: context,
                builder: (context) =>
                    PlayerDialog(addEle: widget.addEle, num: players.toInt()));
          },
          color: AppStyle.accentColor,
          child: Text(
            'Submit',
            style: AppStyle.buttonText,
          ),
        ),
      ],
    );
  }
}
