class HiveFunctions {
  String allPlayers(List data) {
    String players = '';
    int len = data.length;
    for (int i = 0; i < len; i++) {
      players += data[i][0] + ' ';
    }
    return (players);
  }

  List newScoreBoards(int len) {
    String s = 'Player ';
    List list = [];
    for (int i = 0; i < len; i++) {
      list.add(['$s $i', 0]);
    }
    return (list);
  }
}
