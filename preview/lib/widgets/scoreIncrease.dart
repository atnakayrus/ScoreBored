import 'package:flutter/material.dart';

import '../constants/AppStyle.dart';

class ScoreIncrease extends StatelessWidget {
  ScoreIncrease(
      {super.key,
      required this.data,
      required this.onIncrease,
      required this.index});
  List data;
  Function onIncrease;
  int index;
  @override
  Widget build(BuildContext context) {
    List<TextEditingController> scorePlayer = [];
    for (int i = 0; i < data.length; i++) {
      scorePlayer.add(TextEditingController());
    }
    return AlertDialog(
      backgroundColor: AppStyle.bgCardColor,
      title: Center(
          child: Column(
        children: const [
          Text('Add Scores:'),
          Divider(
            height: 10,
          ),
        ],
      )),
      content: Container(
        // height: 300,
        width: 300,
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            String name = data[index][0];
            return TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '$name\'s Score',
              ),
              controller: scorePlayer[index],
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            );
          },
          itemCount: scorePlayer.length,
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
            for (int i = 0; i < scorePlayer.length; i++) {
              String s =
                  ((scorePlayer[i].text) == '' ? '0' : scorePlayer[i].text);
              int n = int.parse(s);
              // print(s);
              onIncrease(i + index, n);
            }
            Navigator.of(context).pop();
          },
          color: AppStyle.accentColor,
          child: Text('Submit'),
        ),
      ],
    );
  }
}
