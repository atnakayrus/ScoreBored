import 'package:flutter/material.dart';
import 'package:preview/constants/Appstyle.dart';

Widget tapcard(VoidCallback onTap, List data) {
  String name = data[0];
  int score = data[1];
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppStyle.bgCardColor,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Player: $name',
                        style: AppStyle.mainTitle,
                      ),
                      Text(
                        'Score: $score',
                        style: AppStyle.mainContent,
                      )
                    ],
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    size: 30.0,
                  )),
            ],
          ),
        ),
      ),
    ),
  );
}
