import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:preview/constants/Appstyle.dart';

class ConfirmPopUp extends StatelessWidget {
  Function confirmAction;
  ConfirmPopUp({super.key, required this.confirmAction});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppStyle.bgCardColor,
      title: Text('Are you sure you wish to delete this?'),
      actions: [
        MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('No'),
          color: AppStyle.accentColor,
        ),
        MaterialButton(
          onPressed: () {
            confirmAction();
            Navigator.of(context).pop();
          },
          child: Text('Yes'),
          color: Colors.red,
        )
      ],
    );
  }
}
