import 'package:hive_flutter/hive_flutter.dart';
import 'package:preview/Functions/datafunctions.dart';

class DataBase {
  HiveFunctions fun = HiveFunctions();
  List scoreBoards = [];
  List dates = [];
  final _mybox = Hive.box('Scores');

  void createInitialData() {
    scoreBoards = [
      [
        ['Player1', 0, []],
        ['Player2', 0, []]
      ]
    ];
    dates.add(fun.dateFormatter(DateTime.now()));
  }

  void LoadData() {
    scoreBoards = _mybox.get('ScoreBoards');
    dates = _mybox.get('Dates');
    // scoreBoards = [];
    // dates = [];
    // updateData();
  }

  void updateData() {
    _mybox.put('ScoreBoards', scoreBoards);
    _mybox.put('Dates', dates);
  }
}
