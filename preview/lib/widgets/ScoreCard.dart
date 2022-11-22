import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:preview/Functions/datafunctions.dart';
import 'package:preview/constants/Appstyle.dart';
import 'package:preview/widgets/confirmpopup.dart';

class scorecard extends StatelessWidget {
  scorecard({
    super.key,
    required this.onTap,
    required this.data,
    required this.onDelete,
    required this.onLongPress,
    required this.date,
  });
  VoidCallback onTap;
  VoidCallback onDelete;
  VoidCallback onLongPress;
  List data;
  String date;
  @override
  Widget build(BuildContext context) {
    HiveFunctions func = HiveFunctions();
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 0),
      child: InkWell(
        onTap: onTap,
        // borderRadius: BorderRadius.circular(10),
        onLongPress: onLongPress,
        child: Slidable(
          endActionPane: ActionPane(motion: StretchMotion(), children: [
            SlidableAction(
              backgroundColor: Colors.red,
              onPressed: (context) {
                showDialog(
                    context: context,
                    builder: (context) =>
                        ConfirmPopUp(confirmAction: onDelete));
              },
              icon: Icons.delete,
            )
          ]),
          child: Container(
            width: double.infinity,
            // color: AppStyle.accentColor,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppStyle.bgCardColor,
              boxShadow: AppStyle.borderShadow,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          func.allPlayers(data),
                          style: AppStyle.mainTitle,
                        ),
                        Text(
                          date,
                          style: AppStyle.mainContent,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
