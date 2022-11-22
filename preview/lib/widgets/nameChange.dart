import 'package:flutter/material.dart';

import '../constants/AppStyle.dart';

class NameChange extends StatelessWidget {
  NameChange(
      {super.key,
      required this.data,
      required this.editName,
      required this.index});
  List data;
  Function editName;
  int index;
  @override
  Widget build(BuildContext context) {
    TextEditingController namePlayerEdit = TextEditingController();
    String name = data[0];
    return AlertDialog(
      backgroundColor: AppStyle.bgCardColor,
      title: Center(
          child: Column(
        children: const [
          Text('Edit Name:'),
          Divider(
            height: 10,
          ),
        ],
      )),
      content: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: '$name\'s New name',
        ),
        controller: namePlayerEdit,
        textInputAction: TextInputAction.next,
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
            String s =
                ((namePlayerEdit.text) == '' ? name : namePlayerEdit.text);
            editName(index, s);
            Navigator.of(context).pop();
          },
          color: AppStyle.accentColor,
          child: Text('Submit'),
        ),
      ],
    );
  }
}