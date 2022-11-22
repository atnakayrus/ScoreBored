import 'package:flutter/material.dart';
import 'package:preview/Functions/hivefn.dart';
import 'package:preview/constants/Appstyle.dart';
import 'package:preview/widgets/scoreIncrease.dart';
import 'package:preview/widgets/tapCards.dart';

class TapIncrease extends StatefulWidget {
  List data;
  Function onIncrease;
  int index;
  Function editName;
  TapIncrease(
      {super.key,
      required this.data,
      required this.onIncrease,
      required this.index,
      required this.editName});

  @override
  State<TapIncrease> createState() => _TapIncreaseState();
}

class _TapIncreaseState extends State<TapIncrease> {
  DataBase db = DataBase();
  void addScore(int j, int score) {
    setState(() {
      widget.onIncrease(widget.index, j, score);
    });
    db.updateData();
  }

  void editName(int j, String name) {
    setState(() {
      widget.editName(widget.index, j, name);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.mainColor,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return ScoreIncrease(
                        data: widget.data,
                        onIncrease: addScore,
                        index: 0,
                      );
                    });
              },
              icon: const Icon(
                Icons.add,
                size: 30,
              )),
        ],
      ),
      backgroundColor: AppStyle.bgColor,
      body: ListView.builder(
        itemBuilder: (context, index) {
          return tapcard(
            onTap: () {},
            data: widget.data[index],
            onIncrease: addScore,
            index: index,
            size: widget.data.length,
            onDelete: () {
              setState(() {
                widget.data.removeAt(index);
              });
              db.updateData();
            },
            editName: editName,
          );
        },
        itemCount: widget.data.length,
      ),
    );
  }
}
