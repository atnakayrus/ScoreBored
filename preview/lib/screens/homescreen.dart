import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:preview/constants/Appstyle.dart';
import 'package:preview/screens/tapIncrease.dart';
import 'package:preview/widgets/ScoreCard.dart';
import 'package:preview/widgets/customAddDialogbox.dart';
import 'package:preview/widgets/tapCards.dart';
import 'package:preview/Functions/hivefn.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  // final mybox = Hive.box('mybox');
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _myBox = Hive.box('mybox');
  DataBase db = DataBase();
  @override
  void initState() {
    // TODO: implement initState
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
    });
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
          return scorecard(() {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        TapIncrease(data: db.scoreBoards[index])));
          }, () {
            setState(() {
              db.scoreBoards.removeAt(index);
            });
          }, db.scoreBoards[index]);
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
