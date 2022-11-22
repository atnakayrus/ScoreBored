import 'package:flutter/material.dart';
import 'package:preview/Functions/datafunctions.dart';
import 'package:preview/constants/AppStyle.dart';

class PlayerDialog extends StatefulWidget {
  Function addEle;
  int num;
  PlayerDialog({super.key, required this.addEle, required this.num});

  @override
  State<PlayerDialog> createState() => _PlayerDialogState();
}

class _PlayerDialogState extends State<PlayerDialog> {
  late List<TextEditingController> namePlayer = [];
  HiveFunctions func = HiveFunctions();
  List<int> options = [1, 2, 3, 4, 5, 6, 7, 8];
  @override
  void initState() {
    for (int i = 0; i < widget.num; i++) {
      namePlayer.add(TextEditingController());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppStyle.bgCardColor,
      title: Center(
          child: Column(
        children: const [
          Text('Player Names:'),
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
            return TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Player ${index + 1} name',
              ),
              controller: namePlayer[index],
              textInputAction: TextInputAction.next,
            );
          },
          itemCount: namePlayer.length,
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
            List li = [];
            for (int i = 1; i < namePlayer.length + 1; i++) {
              String s = namePlayer[i - 1].text == ''
                  ? 'Player$i'
                  : namePlayer[i - 1].text;
              li.add([s, 0, []]);
            }
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
