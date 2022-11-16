import 'package:flutter/material.dart';
import 'package:preview/constants/Appstyle.dart';

Widget tapcard(VoidCallback onTap, data) {
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
                        'Players: ++++',
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
