import 'package:flutter/material.dart';
import 'package:preview/Functions/datafunctions.dart';
import 'package:preview/constants/AppStyle.dart';

// ignore: must_be_immutable
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
      content: SizedBox(
        // height: 300,
        width: 300,
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
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
          child: Text(
            'Cancel',
            style: AppStyle.buttonText,
          ),
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
          child: Text(
            'Submit',
            style: AppStyle.buttonText,
          ),
        ),
      ],
    );
  }
}
