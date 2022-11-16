import 'package:flutter/material.dart';
import 'package:preview/constants/Appstyle.dart';
import 'package:preview/screens/tapIncrease.dart';
import 'package:preview/widgets/ScoreCard.dart';
import 'package:preview/widgets/customAddDialogbox.dart';
import 'package:preview/widgets/tapCards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.mainColor,
        title: const Text('Your Scorecards'),
      ),
      backgroundColor: AppStyle.bgColor,
      body: Column(children: [
        scorecard(() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TapIncrease()));
        }, 5)
      ]),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppStyle.mainColor,
        onPressed: () {
          showDialog(context: context, builder: (context) => AddDialog());
        },
        label: const Text('Add new'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
