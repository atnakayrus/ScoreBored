import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:preview/Functions/datafunctions.dart';
import 'package:preview/constants/Appstyle.dart';
import 'package:preview/screens/tapIncrease.dart';
import 'package:preview/widgets/ScoreCard.dart';
import 'package:preview/widgets/customAddDialogbox.dart';
import 'package:preview/Functions/hivefn.dart';

class HomeScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _myBox = Hive.box('Scores');
  HiveFunctions fun = HiveFunctions();
  DataBase db = DataBase();
  @override
  void initState() {
    if (_myBox.get('ScoreBoards') == null) {
      db.createInitialData();
    } else {
      db.LoadData();
    }
    super.initState();
  }

  void addEle(List li) {
    setState(() {
      db.scoreBoards.add(li);
      db.dates.add(fun.dateFormatter(DateTime.now()));
    });
    db.updateData();
  }

  void addScore(int i, int j, int score) {
    setState(() {
      db.scoreBoards[i][j][1] += score;
      db.scoreBoards[i][j][2].add(score);
    });
    db.updateData();
  }

  void editName(int i, int j, String name) {
    setState(() {
      db.scoreBoards[i][j][0] = name;
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.mainColor,
        title: const Text('Your Scorecards'),
      ),
      backgroundColor: AppStyle.bgColor,
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return scorecard(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TapIncrease(
                            data: db.scoreBoards[index],
                            onIncrease: addScore,
                            index: index,
                            editName: editName,
                          ))).then((value) {
                setState(() {});
                db.updateData();
              });
            },
            onDelete: () {
              setState(() {
                db.scoreBoards.removeAt(index);
                db.dates.removeAt(index);
              });
              db.updateData();
            },
            data: db.scoreBoards[index],
            onLongPress: () {},
            date: db.dates[index],
          );
        }),
        itemCount: db.scoreBoards.length,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppStyle.mainColor,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AddDialog(
                    addEle: addEle,
                  ));
        },
        label: const Text('Add new'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
