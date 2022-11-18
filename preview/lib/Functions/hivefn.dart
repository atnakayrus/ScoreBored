import 'package:hive_flutter/hive_flutter.dart';

class DataBase {
  List scoreBoards = [];
  final _mybox = Hive.box('mybox');

  void createInitialData() {
    scoreBoards = [
      [
        ['Player1', 0],
        ['Player2', 0]
      ]
    ];
  }

  void LoadData() {
    scoreBoards = _mybox.get('ScoreBoards');
  }

  void updateData() {
    _mybox.put('ScoreBoards', scoreBoards);
  }
}
