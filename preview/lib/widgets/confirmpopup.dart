import 'package:flutter/material.dart';
import 'package:preview/constants/Appstyle.dart';

class ConfirmPopUp extends StatelessWidget {
  final Function confirmAction;
  const ConfirmPopUp({super.key, required this.confirmAction});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppStyle.bgCardColor,
      title: const Text('Are you sure you wish to delete this?'),
      actions: [
        MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: AppStyle.accentColor,
          child: const Text('No'),
        ),
        MaterialButton(
          onPressed: () {
            confirmAction();
            Navigator.of(context).pop();
          },
          color: Colors.red,
          child: const Text('Yes'),
        )
      ],
    );
  }
}
