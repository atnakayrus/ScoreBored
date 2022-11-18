import 'package:flutter/material.dart';
import 'package:preview/Functions/datafunctions.dart';
import 'package:preview/constants/Appstyle.dart';

Widget scorecard(VoidCallback onTap, VoidCallback onDelete, List data) {
  HiveFunctions func = HiveFunctions();
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        color: AppStyle.accentColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      func.allPlayers(data),
                      style: AppStyle.mainTitle,
                    ),
                    Text(
                      'date ++++',
                      style: AppStyle.mainContent,
                    )
                  ],
                ),
              ),
            ),
            IconButton(onPressed: onDelete, icon: const Icon(Icons.delete)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.play_arrow)),
          ],
        ),
      ),
    ),
  );
}
