import 'package:flutter/material.dart';
import 'package:preview/constants/AppStyle.dart';

class AddDialog extends StatefulWidget {
  const AddDialog({super.key});

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  TextEditingController no_of_players = TextEditingController();
  int players = 1;
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
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            Row(
              children: [
                const Text('Enter Number of Players'),
                // DropdownButtonFormField(
                //   items: options.map((int item) {
                //     return DropdownMenuItem(value: item, child: Text('$item'));
                //   }).toList(),
                //   onChanged: (newval) {},
                // )
              ],
            ),
          ],
        ),
      ),
      actions: [ElevatedButton(onPressed: () {}, child: Text('Submit'))],
    );
  }
}
